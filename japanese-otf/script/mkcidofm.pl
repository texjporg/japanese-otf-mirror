opendir(OPLD, "opl") || mkdir("opl",0755) || die "cannot mkdir opl";
opendir(OFMD, "ofm") || mkdir("ofm",0755) || die "cannot mkdir ofm";
$font_at=1.0;
@font_base_name=("cjmr", "cjgr", "cjmb", "cjgb", "cjmgr", "cjml", "cjge");
for ($d=0; $d<=1; $d++){
	if ($d==0){$dir="h";}elsif($d==1){$dir="v";}
	foreach $base_name(@font_base_name){
		$font_name="otf-$base_name-$dir";
		open(OPL, ">opl/$font_name.opl") || die "cannot make file";
		print OPL "(OFMLEVEL D 1)\n";
		printf OPL "(FONTDIR %s)\n", $d==1 ? "RT" : "TL";
		print OPL "(FAMILY HIRAMIN)\n";
		print OPL "(FACE F MRR)\n";
		print OPL "(CODINGSCHEME UNSPECIFIED)\n";
		print OPL "(DESIGNSIZE R 10.0)\n";
		print OPL "(COMMENT DESIGNSIZE IS IN POINTS)\n";
		print OPL "(COMMENT OTHER SIZES ARE MULTIPLES OF DESIGNSIZE)\n";
		print OPL "(CHECKSUM H 0)\n";
		print OPL "(SEVENBITSAFEFLAG FALSE)\n";
		print OPL "(FONTDIMEN\n";
		print OPL "   (SLANT R 0.0)\n";
		print OPL "   (SPACE R 0.0)\n";
		printf OPL "   (STRETCH R %f)\n", $font_at/10;
		print OPL "   (SHRINK R 0.0)\n";
		printf OPL "   (XHEIGHT R %f)\n", $font_at;
		printf OPL "   (QUAD R %f)\n", $font_at;
		print OPL "   )\n";
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
			if ($dir eq "h"){
				$accender=0.88;
				$decender=0.12;
			}elsif($dir eq "v"){
				$accender=0.5;
				$decender=0.5;
			}
			printf OPL "(CHARACTER D %d\n", $cidcode;
			printf OPL "   (CHARWD R %f)\n", $width*$font_at;
			printf OPL "   (CHARHT R %f)\n", $font_at*$accender ;
			printf OPL "   (CHARDP R %f)\n", $font_at*$decender;
			print  OPL "   )\n";
		}
		close(OPL);
		system("opl2ofm opl/$font_name.opl ofm/$font_name.ofm")
	}
}
