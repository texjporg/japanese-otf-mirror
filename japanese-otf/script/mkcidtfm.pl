opendir(PLD, "pl") || mkdir("pl",0755) || die "cannot mkdir pl";
opendir(TFMD, "tfm") || mkdir("tfm",0755) || die "cannot mkdir tfm";
$font_at=1.0;
@font_base_name=("cjmr", "cjgr", "cjmb", "cjgb", "cjmgr", "cjml", "cjge");
for ($d=0; $d<=1; $d++){
	if ($d==0){$dir="h";}elsif($d==1){$dir="v";}
	foreach $base_name(@font_base_name){
		@font_chartype_1=(); # 1/2
		@font_chartype_2=(); # 1/3
		@font_chartype_3=(); # 1/4
		$font_name="otf-$base_name-$dir";
		open(PL, ">pl/$font_name.pl") || die "cannot make file";
		print PL "(COMMENT THIS IS A KANJI FORMAT FILE)\n";
		print PL "(DIRECTION TATE)\n" if ($d==1);
		print PL "(FAMILY HIRAMIN)\n";
		print PL "(FACE F MRR)\n";
		print PL "(CODINGSCHEME TEX KANJI TEXT)\n";
		print PL "(DESIGNSIZE R 10.0)\n";
		print PL "(COMMENT DESIGNSIZE IS IN POINTS)\n";
		print PL "(COMMENT OTHER SIZES ARE MULTIPLES OF DESIGNSIZE)\n";
		print PL "(CHECKSUM H 0)\n";
		print PL "(SEVENBITSAFEFLAG FALSE)\n";
		print PL "(FONTDIMEN\n";
		print PL "   (SLANT R 0.0)\n";
		print PL "   (SPACE R 0.0)\n";
		print PL "   (STRETCH R 0.0)\n";
		print PL "   (SHRINK R 0.0)\n";
		printf PL "   (XHEIGHT R %f)\n", $font_at;
		printf PL "   (QUAD R %f)\n", $font_at;
		print PL "   (EXTRASPACE R 0.0)\n";
		print PL "   (EXTRASTRETCH R 0.0)\n";
		print PL "   (EXTRASHRINK R 0.0)\n";
		print PL "   )\n";
		for($cidcode=0; $cidcode<=23059; $cidcode++){
			if ($dir eq "h"){
				if (($cidcode >= 231) && ($cidcode <= 632)){
					$width=0.5;
				}elsif(($cidcode == 8718) || ($cidcode == 8719)){
					$width=0.5;
				}elsif((12063 <= $cidcode) && ($cidcode <= 12087)){
					$width=0.5;
				}elsif((9738 <= $cidcode) && ($cidcode <= 9757)){
					$width=0.25;
				}elsif((9758 <= $cidcode) && ($cidcode <= 9778)){
					$width=0.333333;
				}else{$width=1.0;}
			}elsif($dir eq "v"){
				if ((8950 <= $cidcode) && ($cidcode <= 9353)){
					$width=0.5;
				}elsif((13254 <= $cidcode) && ($cidcode <= 13273)){
					$width=0.25;
				}elsif((13274 <= $cidcode) && ($cidcode <= 13294)){
					$width=0.333333;
				}else{$width=1.0;}
			}
			if ($width==0.5){
				push @font_chartype_1, "$cidcode";
			}elsif($width==0.333333){
				push @font_chartype_2, "$cidcode";
			}elsif($width==0.25){
				push @font_chartype_3, "$cidcode";
			}
		}
		if ($dir eq "h"){
			$accender=0.88;
			$decender=0.12;
		}elsif($dir eq "v"){
			$accender=0.5;
			$decender=0.5;
		}
		# some of $cidcode are invalid when interpreted as JIS code
		# so it fails 'valid_jis_code' test of pPLtoTF.
		# upPLtoTF omits the test, so we can use it instead.
		# charcodes are represented in U... (not J...)
		# to make sure that we use upPLtoTF
		print PL "(CHARSINTYPE D 1\n";
		foreach $cidcode(@font_chartype_1){
			printf PL "   U%04X\n", $cidcode;
		}
		print  PL "   )\n";
		print PL "(CHARSINTYPE D 2\n";
		foreach $cidcode(@font_chartype_2){
			printf PL "   U%04X\n", $cidcode;
		}
		print  PL "   )\n";
		print PL "(CHARSINTYPE D 3\n";
		foreach $cidcode(@font_chartype_3){
			printf PL "   U%04X\n", $cidcode;
		}
		print  PL "   )\n";
		print PL "(TYPE D 0\n";
		printf PL "   (CHARWD R %f)\n", 1.0*$font_at;
		printf PL "   (CHARHT R %f)\n", $font_at*$accender ;
		printf PL "   (CHARDP R %f)\n", $font_at*$decender;
		print  PL "   )\n";
		print PL "(TYPE D 1\n";
		printf PL "   (CHARWD R %f)\n", 0.5*$font_at;
		printf PL "   (CHARHT R %f)\n", $font_at*$accender ;
		printf PL "   (CHARDP R %f)\n", $font_at*$decender;
		print  PL "   )\n";
		print PL "(TYPE D 2\n";
		printf PL "   (CHARWD R %f)\n", 0.333333*$font_at;
		printf PL "   (CHARHT R %f)\n", $font_at*$accender ;
		printf PL "   (CHARDP R %f)\n", $font_at*$decender;
		print  PL "   )\n";
		print PL "(TYPE D 3\n";
		printf PL "   (CHARWD R %f)\n", 0.25*$font_at;
		printf PL "   (CHARHT R %f)\n", $font_at*$accender ;
		printf PL "   (CHARDP R %f)\n", $font_at*$decender;
		print  PL "   )\n";
		close(PL);
		# we use upPLtoTF instead of pPLtoTF (see comment above)
		system("uppltotf pl/$font_name.pl tfm/$font_name.tfm")
	}
}
