#!/usr/bin/perl
opendir(OVP, "ovp") || mkdir("ovp",0755) || die "cannot mkdir ovp";
opendir(VF, "vf") || mkdir("vf",0755) || die "cannot mkdir vf";
&makevf;

sub makevf {
	for ($l=1; $l<=3; $l++){
		if ($l==1){$lang="c";$max_hex=7;}elsif ($l==2){$lang="k";$max_hex=4;}elsif ($l==3){$lang="t";$max_hex=4;}
		for ($k=0; $k<=1; $k++){#face
			if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}
			for ($i=0; $i<=1; $i++){#direction
				if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
				$cidcode=0;
				for ($first_hex=0x0; $first_hex <= $max_hex; $first_hex++){
					$filename="cid$lang$face".sprintf("%x",$first_hex)."-$dir";
					open(OUT, ">ovp/$filename.ovp")||die "$!";
					&fonthead;
					print OUT "   (FONTNAME otf-c$lang$face-$dir)\n";
					&fontfoot;
					&writechar;
					close(OUT);
					system("ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
					unlink "vf/$filename.ofm";
				}
			}
		}
	}
}

sub fonthead {
if ($lang eq "c"){
	print OUT "(VTITLE JVF for Adobe-GB1-5)\n"
}elsif ($lang eq "t"){
	print OUT "(VTITLE JVF for Adobe-CNS1-7)\n"
}elsif ($lang eq "k"){
	print OUT "(VTITLE JVF for Adobe-Korea1-2)\n"
}
print OUT <<END_OF_DATA;
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
#	&determine_width;
	$width=1.0;
	printf OUT "(CHARACTER H %X\n", $jiscode;
	printf OUT "   (CHARWD R %f)\n", $width;
	print OUT "   (MAP\n";
	printf OUT "      (SETCHAR H %X)\n", $cidcode;
	if (($dir eq "v")&&($width!=1.0)){
		$correction=1.0-$width;
		printf OUT "      (MOVERIGHT R -%f)\n", $correction;
	}
	print OUT "      )\n";
	print OUT "   )\n";
}

sub determine_width{
	if ($lang eq "c"){#simplified chinese
		if ($dir eq "h"){
			if ($cidcode==0){$width=0.5;}
		}elsif($dir eq "v"){
			if ($cidcode==0){$width=0.5;}
		}
	}elsif ($lang eq "t"){#traditional chinese
		if ($dir eq "h"){
			if ($cidcode==0){$width=0.5;}
		}elsif($dir eq "v"){
			if ($cidcode==0){$width=0.5;}
		}
	}elsif ($lang eq "k"){#korean
		if ($dir eq "h"){
			if ($cidcode==0){$width=0.5;}
		}elsif($dir eq "v"){
			if ($cidcode==0){$width=0.5;}
		}
	}
	if($width==0){$width=1.0;}
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
				&printchar($first_hex,$ku,$ten);
				$cidcode++;
#			} else {
#				&printgeta($first_hex,$ku,$ten);
			}
		}
	}
}
