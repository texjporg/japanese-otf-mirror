#!/usr/bin/perl
$multi=3;
@tex_tfm_h=(0x00, 0x0B, 0x00, 0x01, 0x00, 0x2B, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x0E, 0x54, 0x45, 0x58, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x20, 0x54, 0x45, 0x58, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x4F, 0x54, 0x46, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x14, 0x7B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xEB, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x99, 0x9A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x33, 0x33, 0x00, 0x02, 0x00, 0x00);
@tex_tfm_v=(0x00, 0x09, 0x00, 0x01, 0x00, 0x2B, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x0E, 0x54, 0x45, 0x58, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x20, 0x54, 0x45, 0x58, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x4F, 0x54, 0x46, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x99, 0x9A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x33, 0x33, 0x00, 0x02, 0x00, 0x00);
@dvips_tfm_h=(0x00, 0x0B, 0x00, 0x01, 0x00, 0x1B, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x14, 0x7B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xEB, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
@dvips_tfm_v=(0x00, 0x09, 0x00, 0x01, 0x00, 0x1B, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);

# halfwidth characters U+FF61..FF9F are correspond to (0x6D5x, 0x6D6x, 0x6E3x, 0x6E4x) in subfont
@tex_tfm_sub_h=map{ hex($_) } qw/
	00 0b 00 40 00 6c 00 12 00 00 00 01 00 03 00 02
	00 02 00 01 00 00 00 00 00 00 00 09 00 00 00 00
	00 a0 00 00 0e 54 45 58 20 4b 41 4e 4a 49 20 54
	45 58 54 00 00 00 00 00 00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00 00 00 00 00 09 4f 54 46
	20 4b 41 4e 4a 49 00 00 00 00 00 00 00 00 00 00
	80 00 00 00 00 00 00 00 6d 51 00 01 6d 52 00 01
	6d 53 00 01 6d 54 00 01 6d 55 00 01 6d 56 00 01
	6d 57 00 01 6d 58 00 01 6d 59 00 01 6d 5a 00 01
	6d 5b 00 01 6d 5c 00 01 6d 5d 00 01 6d 5e 00 01
	6d 5f 00 01 6d 60 00 01 6d 61 00 01 6d 62 00 01
	6d 63 00 01 6d 64 00 01 6d 65 00 01 6d 66 00 01
	6d 67 00 01 6d 68 00 01 6d 69 00 01 6d 6a 00 01
	6d 6b 00 01 6d 6c 00 01 6d 6d 00 01 6d 6e 00 01
	6d 6f 00 01 6e 30 00 01 6e 31 00 01 6e 32 00 01
	6e 33 00 01 6e 34 00 01 6e 35 00 01 6e 36 00 01
	6e 37 00 01 6e 38 00 01 6e 39 00 01 6e 3a 00 01
	6e 3b 00 01 6e 3c 00 01 6e 3d 00 01 6e 3e 00 01
	6e 3f 00 01 6e 40 00 01 6e 41 00 01 6e 42 00 01
	6e 43 00 01 6e 44 00 01 6e 45 00 01 6e 46 00 01
	6e 47 00 01 6e 48 00 01 6e 49 00 01 6e 4a 00 01
	6e 4b 00 01 6e 4c 00 01 6e 4d 00 01 6e 4e 00 01
	6e 4f 00 01 02 11 00 00 01 11 00 00 00 00 00 00
	00 08 00 00 00 10 00 00 00 00 00 00 00 0e 14 7b
	00 00 00 00 00 01 eb 85 00 00 00 00 00 00 00 00
	00 00 00 00 00 01 99 9a 00 00 00 00 00 10 00 00
	00 10 00 00 00 04 00 00 00 03 33 33 00 02 00 00
/;
@dvips_tfm_ucs_h=map{ hex($_) } qw/
	00 0b 00 40 00 5c 00 02 00 00 00 01 00 03 00 02
	00 02 00 01 00 00 00 00 00 00 00 09 00 00 00 00
	00 a0 00 00 00 00 00 00 ff 61 00 01 ff 62 00 01
	ff 63 00 01 ff 64 00 01 ff 65 00 01 ff 66 00 01
	ff 67 00 01 ff 68 00 01 ff 69 00 01 ff 6a 00 01
	ff 6b 00 01 ff 6c 00 01 ff 6d 00 01 ff 6e 00 01
	ff 6f 00 01 ff 70 00 01 ff 71 00 01 ff 72 00 01
	ff 73 00 01 ff 74 00 01 ff 75 00 01 ff 76 00 01
	ff 77 00 01 ff 78 00 01 ff 79 00 01 ff 7a 00 01
	ff 7b 00 01 ff 7c 00 01 ff 7d 00 01 ff 7e 00 01
	ff 7f 00 01 ff 80 00 01 ff 81 00 01 ff 82 00 01
	ff 83 00 01 ff 84 00 01 ff 85 00 01 ff 86 00 01
	ff 87 00 01 ff 88 00 01 ff 89 00 01 ff 8a 00 01
	ff 8b 00 01 ff 8c 00 01 ff 8d 00 01 ff 8e 00 01
	ff 8f 00 01 ff 90 00 01 ff 91 00 01 ff 92 00 01
	ff 93 00 01 ff 94 00 01 ff 95 00 01 ff 96 00 01
	ff 97 00 01 ff 98 00 01 ff 99 00 01 ff 9a 00 01
	ff 9b 00 01 ff 9c 00 01 ff 9d 00 01 ff 9e 00 01
	ff 9f 00 01 02 11 00 00 01 11 00 00 00 00 00 00
	00 08 00 00 00 10 00 00 00 00 00 00 00 0e 14 7b
	00 00 00 00 00 01 eb 85 00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00
	00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00
/;

opendir(TFM, "tfm") || mkdir("tfm",0755) || die "cannot mkdir tfm";
&make_utf_tfm;
&make_cid_tfm;
&make_multi_utf_tfm;
&make_utf_allinone_tfm;
&make_multi_cid_tfm;

sub make_utf_tfm {
	for ($k=0; $k<=6; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}elsif ($k==2){$face="mb";}
			elsif ($k==3){$face="gb";}elsif ($k==4){$face="mgr";}elsif ($k==5){$face="ml";}
			elsif ($k==6){$face="ge";}
		for ($l=0; $l<=0; $l++){#language
			if ($l==0) {$lang="j";} elsif ($l==1) {$lang="k";} 
				elsif ($l==2) {$lang="c";} elsif ($l==3){$lang="t";}
			for ($i=0; $i<=1; $i++){#direction
				if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
				$varfilename="otf-u$lang$face-$dir";
				open(DVIPSTFM,">tfm/$varfilename.tfm") || die "Can't make \'tfm/$varfilename.tfm\'!\n";
				if ($i==0) {
					if ($lang=="j") {
						@dvips_tfm = @dvips_tfm_ucs_h;
					} else {
						@dvips_tfm = @dvips_tfm_h;
					}
					foreach $binary(@dvips_tfm  ) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}elsif ($i==1){
					foreach $binary(@dvips_tfm_v) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}
				close(DVIPSTFM);
				for ($first_hex=0x0; $first_hex <= 0xf; $first_hex++){
					$filename="utf$lang$face".sprintf("%x",$first_hex)."-$dir";
					open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
					if ($i==0) {
						if ($lang=="j" && $first_hex==0xf) {
							@tex_tfm = @tex_tfm_sub_h;
						} else {
							@tex_tfm = @tex_tfm_h;
						}
						foreach $binary(@tex_tfm  ) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}elsif ($i==1){
						foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}
					close(TEXTFM);
				}
			}
		}
	}
}

sub make_cid_tfm {
	for ($k=0; $k<=6; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}elsif ($k==2){$face="mb";}
			elsif ($k==3){$face="gb";}elsif ($k==4){$face="mgr";}elsif ($k==5){$face="ml";}
			elsif ($k==6){$face="ge";}
		for ($l=0; $l<=0; $l++){#language
			if ($l==0) {$lang="j";} elsif ($l==1) {$lang="k";} 
				elsif ($l==2) {$lang="c";} elsif ($l==3){$lang="t";}
			for ($i=0; $i<=1; $i++){#direction
				if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
				$varfilename="otf-cj$face-$dir";
				open(DVIPSTFM,">tfm/$varfilename.tfm") || die "Can't make \'tfm/$varfilename.tfm\'!\n";
				binmode(DVIPSTFM);
				if ($i==0) {
					foreach $binary(@dvips_tfm_h) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}elsif ($i==1){
					foreach $binary(@dvips_tfm_v) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}
				close(DVIPSTFM);
				for ($first_hex=0x0; $first_hex <= 0x5; $first_hex++){
					$filename="cidj$face".sprintf("%x",$first_hex)."-$dir";
					open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
					binmode(TEXTFM);
					if ($i==0) {
						foreach $binary(@tex_tfm_h) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}elsif ($i==1){
						foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}
					close(TEXTFM);
				}
			}
		}
	}
}

sub make_multi_utf_tfm {
	for ($k=0; $k<=1; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}
		for ($l=1; $l<=$multi; $l++){#language
			if ($l==0) {$lang="j";} elsif ($l==1) {$lang="k";} 
				elsif ($l==2) {$lang="c";} elsif ($l==3){$lang="t";}
			for ($i=0; $i<=1; $i++){#direction
				if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
				$varfilename="otf-u$lang$face-$dir";
				open(DVIPSTFM,">tfm/$varfilename.tfm") || die "Can't make \'tfm/$varfilename.tfm\'!\n";
				binmode(DVIPSTFM);
				if ($i==0) {
					foreach $binary(@dvips_tfm_h) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}elsif ($i==1){
					foreach $binary(@dvips_tfm_v) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}
				close(DVIPSTFM);
				for ($first_hex=0x0; $first_hex <= 0xf; $first_hex++){
					$filename="utf$lang$face".sprintf("%x",$first_hex)."-$dir";
					open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
					binmode(TEXTFM);
					if ($i==0) {
						foreach $binary(@tex_tfm_h) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}elsif ($i==1){
						foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}
					close(TEXTFM);
				}
			}
		}
	}
}
sub make_multi_cid_tfm {
	for ($k=0; $k<=1; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}
		for ($l=1; $l<=$multi; $l++){#language
			if ($l==1) {$lang="k";$max_hex=4;} elsif ($l==2) {$lang="c";$max_hex=7;} elsif ($l==3){$lang="t";$max_hex=4;}
			for ($i=0; $i<=1; $i++){#direction
				if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
				$varfilename="otf-c$lang$face-$dir";
				open(DVIPSTFM,">tfm/$varfilename.tfm") || die "Can't make \'tfm/$varfilename.tfm\'!\n";
				binmode(DVIPSTFM);
				if ($i==0) {
					foreach $binary(@dvips_tfm_h) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}elsif ($i==1){
					foreach $binary(@dvips_tfm_v) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
				}
				close(DVIPSTFM);
				for ($first_hex=0x0; $first_hex <= $max_hex; $first_hex++){
					$filename="cid$lang$face".sprintf("%x",$first_hex)."-$dir";
					open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
					binmode(TEXTFM);
					if ($i==0) {
						foreach $binary(@tex_tfm_h) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}elsif ($i==1){
						foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
					}
					close(TEXTFM);
				}
			}
		}
	}
}
sub make_utf_allinone_tfm {
	for ($k=0; $k<=1; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}
		for ($i=0; $i<=1; $i++){#direction
			if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
			for ($first_hex=0x0; $first_hex <= 0xf; $first_hex++){
				$filename="utf$face".sprintf("%x",$first_hex)."-$dir";
				open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
				if ($i==0) {
					if ($first_hex==0xf) {
						@tex_tfm = @tex_tfm_sub_h;
					} else {
						@tex_tfm = @tex_tfm_h;
					}
					foreach $binary(@tex_tfm  ) {$_ = pack("C", $binary);print TEXTFM "$_";}
				}elsif ($i==1){
					foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
				}
				close(TEXTFM);
			}
		}
	}
}

