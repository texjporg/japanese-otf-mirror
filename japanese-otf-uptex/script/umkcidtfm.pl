#!/usr/bin/perl -s

=head1 NAME

umkcidtfm.pl

=head1 USAGE

script/umkcidtfm.pl
script/umkcidtfm.pl -debug

=head1 NOTE

This software is a part of japanese-otf-uptex.

=cut

opendir(PL, "pl") || mkdir("pl",0755) || die "cannot mkdir pl";
opendir(TFM, "tfm") || mkdir("tfm",0755) || die "cannot mkdir tfm";
&make_cid_tfm;
&make_cid_dvips_tfm;

sub make_cid_tfm {
	my ($lang, $face, $dir, $id, $filename);
	foreach $lang (qw/j c k t/){#lang
		foreach $dir (qw/h v/){#direction
			$id='-';
			$pl_name="cid$lang$id-$dir";
			open(OUT, '>', "pl/$pl_name.pl")||die "$!";
			&fonthead($lang,$dir);
			&writechar($lang,$dir);
			&fontfoot($lang,$dir);
			close(OUT);
			foreach $face (qw/mr gr mb gb mgr ml ge/){#face
				$tfm_name="cid$lang$face$id-$dir";
				system("uppltotf -kanji=uptex pl/$pl_name.pl tfm/$tfm_name.tfm");
			}
			unless ($debug){
				unlink "pl/$pl_name.pl";
			}
		}
	}
}

sub make_cid_dvips_tfm {
	my ($lang, $face, $dir, $id, $filename);
	foreach $lang (qw/j c k t/){#lang
		foreach $dir (qw/h v/){#direction
			$pl_name="otf-c$lang-$dir";
			open(OUT, '>', "pl/$pl_name.pl")||die "$!";
			&fonthead_dvips($lang,$dir);
			&writechar($lang,$dir);
			&fontfoot($lang,$dir);
			close(OUT);
			foreach $face (qw/mr gr mb gb mgr ml ge/){#face
				$tfm_name="otf-c$lang$face-$dir";
				system("uppltotf -kanji=uptex pl/$pl_name.pl tfm/$tfm_name.tfm");
			}
			unless ($debug){
				unlink "pl/$pl_name.pl";
			}
		}
	}
}

sub fonthead {
	my ($lang,$dir) = @_;
print OUT <<END_OF_DATA if ($dir eq 'v');
(DIRECTION TATE)
END_OF_DATA
print OUT <<END_OF_DATA;
(FAMILY OTF KANJI)
(FACE F MRR)
(CODINGSCHEME TEX KANJI TEXT)
(DESIGNSIZE R 10.0)
(CHECKSUM O 0)
(SEVENBITSAFEFLAG TRUE)
(FONTDIMEN
   (SLANT R 0.0)
   (SPACE R 0.0)
   (STRETCH R 0.1)
   (SHRINK R 0.0)
   (XHEIGHT R 1.0)
   (QUAD R 1.0)
   (EXTRASPACE R 0.25)
   (EXTRASTRETCH R 0.2)
   (EXTRASHRINK R 0.125)
   )
END_OF_DATA
}

sub fonthead_dvips {
	my ($lang,$dir) = @_;
print OUT <<END_OF_DATA if ($dir eq 'v');
(DIRECTION TATE)
END_OF_DATA
print OUT <<END_OF_DATA;
(FAMILY OTF KANJI)
(FACE F MRR)
(CODINGSCHEME TEX KANJI TEXT)
(DESIGNSIZE R 10.0)
(CHECKSUM O 0)
(SEVENBITSAFEFLAG TRUE)
(FONTDIMEN
   (SLANT R 0.0)
   (SPACE R 0.0)
   (STRETCH R 0.0)
   (SHRINK R 0.0)
   (XHEIGHT R 1.0)
   (QUAD R 1.0)
   (EXTRASPACE R 0.0)
   (EXTRASTRETCH R 0.0)
   (EXTRASHRINK R 0.0)
   )
END_OF_DATA
}

sub fontfoot {
	my ($lang,$dir) = @_;
	my ($ht,$dp) = $dir eq 'h' ? (0.88, 0.12) : (0.5, 0.5);
print OUT <<END_OF_DATA;
(TYPE O 0
   (CHARWD R 1.0)
   (CHARHT R $ht)
   (CHARDP R $dp)
   )
(TYPE O 1
   (CHARWD R 0.5)
   (CHARHT R $ht)
   (CHARDP R $dp)
   )
END_OF_DATA
print OUT <<END_OF_DATA if ($lang eq 'j');
(TYPE O 2
   (CHARWD R 0.25)
   (CHARHT R $ht)
   (CHARDP R $dp)
   )
(TYPE O 3
   (CHARWD R 0.333333)
   (CHARHT R $ht)
   (CHARDP R $dp)
   )
END_OF_DATA
}

sub writechar {
	my ($lang, $dir) = @_;
	my (@type_1ov2, @type_1ov3, @type_1ov4);

	if ($lang eq "j") { # Adobe-Japan1-7
		if ($dir eq "h") {
			@type_1ov2 = (231 .. 632, 8718, 8719, 12063 .. 12087);
			@type_1ov4 = (9738 .. 9757);
			@type_1ov3 = (9758 .. 9778);
		}
		if ($dir eq "v") {
			@type_1ov2 = (8950 .. 9353, 10185 .. 10195, 13295 .. 13319);
			@type_1ov4 = (13254 .. 13273);
			@type_1ov3 = (13274 .. 13294);
		}
	}
	if ($lang eq "c") { # Adobe-GB1-5
		if ($dir eq "h") {
			@type_1ov2 = (814 .. 939, 7716, 22355 .. 22357);
		}
		if ($dir eq "v") {
			@type_1ov2 = (22226 .. 22352, 29060 .. 29063);
		}
	}
	if ($lang eq "k") { # Adobe-Korea1-2
		if ($dir eq "h") {
			@type_1ov2 = (8094 .. 8190);
		}
		if ($dir eq "v") {
			@type_1ov2 = (18255 .. 18351);
		}
	}
	if ($lang eq "t") { # Adobe-CNS1-7
		if ($dir eq "h") {
			@type_1ov2 = (13648 .. 13742, 17603);
		}
		if ($dir eq "v") {
			@type_1ov2 = (17506 .. 17600, 17605);
		}
	}

	if (@type_1ov2) {
		print  OUT "(CHARSINTYPE O 1\n";
		my ($i)=0;
		for $cid (@type_1ov2) {
			print  OUT "  " if ($i % 16 == 0);
			printf OUT " U %04X", $cid;
			print  OUT "\n" if ($i % 16 == 15);
			$i++;
		}
		print  OUT "\n   )\n";
	}
	if (@type_1ov4) {
		print  OUT "(CHARSINTYPE O 2\n";
		my ($i)=0;
		for $cid (@type_1ov4) {
			print  OUT "  " if ($i % 16 == 0);
			printf OUT " U %04X", $cid;
			print  OUT "\n" if ($i % 16 == 15);
			$i++;
		}
		print  OUT "\n   )\n";
	}
	if (@type_1ov3) {
		print  OUT "(CHARSINTYPE O 3\n";
		my ($i)=0;
		for $cid (@type_1ov3) {
			print  OUT "  " if ($i % 16 == 0);
			printf OUT " U %04X", $cid;
			print  OUT "\n" if ($i % 16 == 15);
			$i++;
		}
		print  OUT "\n   )\n";
	}
}
