#!/usr/bin/perl -s

=head1 NAME

umkcidvf.pl

=head1 USAGE

script/umkcidvf.pl
script/umkcidvf.pl -omitfw
script/umkcidvf.pl -debug

=head1 NOTE

This software is a part of japanese-otf-uptex.

=cut

opendir(OVP, "ovp") || mkdir("ovp",0755) || die "cannot mkdir ovp";
opendir(VF, "vf") || mkdir("vf",0755) || die "cannot mkdir vf";
my %adobe_name = (
  'j' => 'Adobe-Japan1-7',
  'c' => 'Adobe-GB1-5',
  'k' => 'Adobe-Korea1-2',
  't' => 'Adobe-CNS1-7'
);
&make_new_vf;

sub make_new_vf {
	my ($lang, $face, $dir, $id, $filename);
	foreach $lang (qw/j c k t/){#lang
		foreach $face (qw/mr gr mb gb mgr ml ge/){#face
			foreach $dir (qw/h v/){#direction
				$id='-';
				$filename="cid$lang$face$id-$dir";
				open(OUT, '>', "ovp/$filename.ovp")||die "$!";
				&writefont($lang,"otf-c$lang$face-$dir");
				&writechar_cid($lang,$dir);
				close(OUT);
				unless ($debug){
					system("ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
					unlink "vf/$filename.ofm";
				}
			}
		}
	}
}

sub writefont {
	my ($lang,$name)=@_;
print OUT <<END_OF_DATA;
(VTITLE JVF for $adobe_name{$lang})
(OFMLEVEL D 0)
(DESIGNSIZE R 10.000000)
(CHECKSUM O 0)
(MAPFONT D 0
   (FONTNAME $name)
   (FONTCHECKSUM O 0)
   (FONTAT R 1.0)
   (FONTDSIZE R 10.000000)
   )
END_OF_DATA
}

sub writechar_cid {
	my ($lang, $dir) = @_;
	my ($cidcode, $width, $correction);
	my ($maxcidcode);
	if      ($lang eq "j") {
		$maxcidcode = 23059;
	} elsif ($lang eq "c") {
		$maxcidcode = 30283;
	} elsif ($lang eq "k") {
		$maxcidcode = 18351;
	} elsif ($lang eq "t") {
		$maxcidcode = 19178;
	} else {
		die "unexpected input!";
	}
	foreach $cidcode (0 .. $maxcidcode){
		$width=1.0;
		if ($lang eq "j") { # Adobe-Japan1-7
		if ($dir eq "h") {
			if (($cidcode >= 231 && $cidcode <= 632)
				 || $cidcode == 8718 || $cidcode == 8719
				 || (12063 <= $cidcode && $cidcode <= 12087)){
				$width=0.5;
			}elsif(9738 <= $cidcode && $cidcode <= 9757){
				$width=0.25;
			}elsif(9758 <= $cidcode && $cidcode <= 9778){
				$width=0.333333;
			}
		}
		if ($dir eq "v") {
			if ((8950 <= $cidcode && $cidcode <= 9353)
				 || (10185 <= $cidcode && $cidcode <= 10195)
				 || (13295 <= $cidcode && $cidcode <= 13319)){
				$width=0.5;
			}elsif(13254 <= $cidcode && $cidcode <= 13273){
				$width=0.25;
			}elsif(13274 <= $cidcode && $cidcode <= 13294){
				$width=0.333333;
			}
		}
		}
		if ($lang eq "c") { # Adobe-GB1-5
		if ($dir eq "h") {
			if (($cidcode >= 814 && $cidcode <= 939)
				 || $cidcode == 7716
				 || (22355 <= $cidcode && $cidcode <= 22357)){
				$width=0.5;
			}
		}
		if ($dir eq "v") {
			if ((22226 <= $cidcode && $cidcode <= 22352)
				 || (29060 <= $cidcode && $cidcode <= 29063)){
				$width=0.5;
			}
		}
		}
		if ($lang eq "k") { # Adobe-Korea1-2
		if ($dir eq "h") {
			if (8094 <= $cidcode && $cidcode <= 8190){
				$width=0.5;
			}
		}
		if ($dir eq "v") {
			if (18255 <= $cidcode && $cidcode <= 18351){
				$width=0.5;
			}
		}
		}
		if ($lang eq "t") { # Adobe-CNS1-7
		if ($dir eq "h") {
			if (($cidcode >= 13648 && $cidcode <= 13742)
				 || $cidcode == 17603 ){
				$width=0.5;
			}
		}
		if ($dir eq "v") {
			if (($cidcode >= 17506 && $cidcode <= 17600)
				 || $cidcode == 17605 ){
				$width=0.5;
			}
		}
		}
		next if ($width==1.0 && defined($omitfw));

		printf OUT "(CHARACTER H %X\n", $cidcode;
		printf OUT "   (CHARWD R %f)\n", $width;
		print  OUT "   (MAP\n";
		printf OUT "      (SETCHAR H %X)\n", $cidcode;
		if (($dir eq "v")&&($width!=1.0)){
			$correction=1.0-$width;
			printf OUT "      (MOVERIGHT R -%f)\n", $correction;
		}
		print OUT "      )\n";
		print OUT "   )\n";
	}
}
