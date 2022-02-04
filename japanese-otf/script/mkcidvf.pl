#!/usr/bin/perl
opendir(OVP, "ovp") || mkdir("ovp",0755) || die "cannot mkdir ovp";
opendir(VF, "vf") || mkdir("vf",0755) || die "cannot mkdir vf";
&makevf;

sub makevf {
	for ($k=0; $k<=6; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}elsif ($k==2){$face="mb";}
			elsif ($k==3){$face="gb";}elsif ($k==4){$face="mgr";}elsif ($k==5){$face="ml";}
			elsif ($k==6){$face="ge";}
		for ($i=0; $i<=1; $i++){#direction
			if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
			$cidcode=0;
			for ($first_hex=0x0; $first_hex <= 0x5; $first_hex++){
				$filename="cidj$face".sprintf("%x",$first_hex)."-$dir";
				open(OUT, ">ovp/$filename.ovp")||die "$!";
				&fonthead;
				print OUT "   (FONTNAME otf-cj$face-$dir)\n";
				&fontfoot;
				&writechar;
				close(OUT);
				system("ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
				unlink "vf/$filename.ofm";
			}
		}
	}
}

sub fonthead {
print OUT <<END_OF_DATA;
(VTITLE JVF for Adobe-Japan1-7)
(OFMLEVEL D 0)
(DESIGNSIZE R 10.000000)
(CHECKSUM O 0)
(MAPFONT D 0
END_OF_DATA
}

sub fontfoot {
print OUT <<END_OF_DATA;
   (FONTCHECKSUM O 0)
   (FONTAT R 1.0)
   (FONTDSIZE R 10.000000)
   )
END_OF_DATA
}#2003/10/22 FONTAT 1.0->1.0
sub printchar {
	$jiscode=($_[1]+0x20)*256+($_[2]+0x20);
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
		if (((8950 <= $cidcode) && ($cidcode <= 9353)) || ((13295 <= $cidcode) && ($cidcode <= 13319))){
			$width=0.5;
		}elsif((10185 <= $cidcode) && ($cidcode <= 10195)){
			$width=0.5;
		}elsif((13254 <= $cidcode) && ($cidcode <= 13273)){
			$width=0.25;
		}elsif((13274 <= $cidcode) && ($cidcode <= 13294)){
			$width=0.333333;
		}else{$width=1.0;}
	}
	printf OUT "(CHARACTER H %X\n", $jiscode;
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

sub printgeta {
	$jiscode=($_[1]+0x20)*256+($_[2]+0x20);
	printf OUT "(CHARACTER H %X\n", $jiscode;
	print OUT "   (CHARWD R 1.0)\n";
	print OUT "   (MAP\n";
	print OUT "      (SETCHAR H 0)\n";
	print OUT "      )\n";
	print OUT "   )\n";
}

sub writechar {
	for ($ku=16; $ku <= 79; $ku++){
		for ($ten=16; $ten <= 79; $ten++){
			if ($ku>=16 && $ku<=79 && $ten>=16 && $ten<=79){
				return if ($cidcode>23059); # Adobe-Japan1-7
				&printchar($first_hex,$ku,$ten);
				$cidcode++;
#			} else {
#				&printgeta($first_hex,$ku,$ten);
			}
		}
	}
}
