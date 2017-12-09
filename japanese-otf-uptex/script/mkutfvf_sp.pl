#!/usr/bin/perl -s

=head1 NAME

mkutfvf_sp.pl

=head1 USAGE

script/mkutfvf_sp.pl
script/mkutfvf_sp.pl -debug
script/mkutfvf_sp.pl -ovp2ovf='wovp2ovf'

=head1 NOTE

This software is a part of otfbeta-uptex (a.k.a. japanese-otf-uptex).

=cut

use script::MakeSPList;

if (!defined($ovp2ovf)) { ## check option '-ovp2ovf=????'
    $ovp2ovf = defined($ENV{'OVP2OVF'}) ? $ENV{'OVP2OVF'} : 'ovp2ovf';
}

$multi=3;
opendir(OVP, "ovp") || mkdir("ovp",0755) || die "cannot mkdir ovp";
opendir(VF, "vf") || mkdir("vf",0755) || die "cannot mkdir vf";

my @face = qw/mr gr mb gb mgr ml ge/;
my @lang = qw/j t c k/; ## priority: j > t > c > k
my %lang_id; foreach $_ (0..$#lang) { $lang_id{$lang[$_]}=$_; }
my @dir = qw/h v/;
my %font_id = qw/1b g      1d h 1e i 1f j
  20 k 21 l 22 m 23 n 24 o 25 p 26 q 27 r
  28 s 29 t 2a u 2b v 2c w 2d x 2e y 2f z/;

&MakeSPList::make_sp_char_list(@lang);

&makejvf;
&makemlvf;
&makeunivf;

sub makejvf {
	foreach $lang ($lang[0]){ #language
		foreach $face (@face){ #face
			foreach $dir (@dir){ #direction
				&makevf_body($face, $dir, $lang);
			}
		}
	}
}
sub makemlvf {
	foreach $lang (@lang[1..$multi]){ #language
		foreach $face (@face[0..1]){ #face
			foreach $dir (@dir){ #direction
				&makevf_body($face, $dir, $lang);
			}
		}
	}
}
sub makeunivf {
		foreach $face (@face[0..1]){ #face
			foreach $dir (@dir){ #direction
				&make_uni_vf_body($face, $dir, @lang);
			}
		}
}

sub makevf_body {
    my ($face, $dir, $lang)=@_;

    my @exist_head=@{$MakeSPList::r_exist_head->{$lang}};
    foreach $first_hex (0x1b, 0x1d .. 0x2b, 0x2f) { # U+1Cxxx, U+2[CDE]xxx : not defined yet
	next if (!$exist_head[$first_hex]);

	$HEX = sprintf("%X", $first_hex);
	$id = $font_id{sprintf("%x", $first_hex)};
	warn "now processing (face:$face, dir:$dir, lang:$lang, first_hex:$HEX, ID:$id) ...\n";
	$filename="utf$lang$face$id-$dir";
	open(OUT, ">ovp/$filename.ovp")||die "$!";
	&fonthead;
	print OUT "(MAPFONT D 0\n   (FONTNAME otf-u$lang$face-$dir)\n";
	&fontfoot;
	&writechar($first_hex, $lang);
	close(OUT);
	unless ($debug){
		system("$ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
		unlink "vf/$filename.ofm";
	}
    }
}

sub make_uni_vf_body {
    my ($face, $dir, @ln)=@_;
    my $lang = join ',', @ln;

    my @exist_head=@{$MakeSPList::r_exist_head->{$lang}};
    foreach $first_hex (0x1b, 0x1d .. 0x2b, 0x2f) { # U+1Cxxx, U+2[CDE]xxx : not defined yet
	next if (!$exist_head[$first_hex]);

	$HEX = sprintf("%X", $first_hex);
	$id = $font_id{sprintf("%x", $first_hex)};
	warn "now processing (face:$face, dir:$dir, lang:MULTI, first_hex:$HEX, ID:$id) ...\n";
	$filename="utf$face$id-$dir";
	open(OUT, ">ovp/$filename.ovp")||die "$!";
	&fonthead;
	foreach $l (0 .. $#ln){
		next if ($exist_head[$first_hex]!~/$ln[$l]/);
		print OUT "(MAPFONT D $l\n   (FONTNAME otf-u$lang[$l]$face-$dir)\n";
		&fontfoot;
	}
	&writechar($first_hex, @ln);
	close(OUT);
	unless ($debug){
		system("$ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
		unlink "vf/$filename.ofm";
	}
    }
}

sub fonthead {
print OUT <<END_OF_DATA;
(VTITLE JVF for UTF16)
(OFMLEVEL D 0)
(DESIGNSIZE R 10.000000)
(CHECKSUM O 0)
END_OF_DATA
}

sub fontfoot {
print OUT <<END_OF_DATA;
   (FONTCHECKSUM O 0)
   (FONTAT R 1.0)
   (FONTDSIZE R 10.000000)
   )
END_OF_DATA
}

sub writechar {
	my ($hex, @ln) = @_;
	my $lang = join ',', @ln;
	my %exist_char=%{$MakeSPList::r_exist_char->{$lang}};

	foreach $ku (16 .. 79){
		foreach $ten (16 .. 79){
			$jis=sprintf("%X", $ku*256 + $ten + 0x2020);
			$uni=sprintf("%X", $hex*0x1000 + ($ku-16)*64 + ($ten-16));
			my $echr=$exist_char{$uni};
			if ($echr) {
				#warn("lang: $lang, jis: $jis, uni: $uni\n");
				print OUT "(CHARACTER H $jis (CHARWD R 1.0) (MAP \n";
				if (@ln>1 && $echr !~ $ln[0]) {
					foreach $l (1 .. $#ln) {
						if ($echr =~ /$ln[$l]/){
							print OUT "      (SELECTFONT D $lang_id{$ln[$l]})\n";
							last;
						}
					}
				}
				print OUT "      (SETCHAR H $uni)))\n";
			}
		}
	}
}
