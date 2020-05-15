#!/usr/bin/perl
$multi=3;
opendir(OVP, "ovp") || mkdir("ovp",0755) || die "cannot mkdir ovp";
opendir(VF, "vf") || mkdir("vf",0755) || die "cannot mkdir vf";
&makejvf;
&makemlvf;

sub makejvf {
	for ($k=0; $k<=6; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}elsif ($k==2){$face="mb";}
			elsif ($k==3){$face="gb";}elsif ($k==4){$face="mgr";}elsif ($k==5){$face="ml";}
			elsif ($k==6){$face="ge";}
		for ($l=0; $l<=0; $l++){#language
			if ($l==0) {$lang="j";} elsif ($l==1) {$lang="k";} 
				elsif ($l==2) {$lang="c";} elsif ($l==3){$lang="t";}
			for ($i=0; $i<=1; $i++){#direction
				if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
				for ($first_hex=0x0; $first_hex <= 0xf; $first_hex++){
					$filename="utf$lang$face".sprintf("%x",$first_hex)."-$dir";
					open(OUT, ">ovp/$filename.ovp")||die "$!";
					&fonthead;
					print OUT "   (FONTNAME otf-u$lang$face-$dir)\n";
					&fontfoot;
					&writechar($first_hex);
					close(OUT);
					system("ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
					unlink "vf/$filename.ofm";
				}
			}
		}
	}
}
sub makemlvf {
	for ($k=0; $k<=1; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}elsif ($k==2){$face="mb";}
			elsif ($k==3){$face="gb";}elsif ($k==4){$face="mgr";}elsif ($k==5){$face="ml";}
			elsif ($k==6){$face="ge";}
		for ($l=1; $l<=$multi; $l++){#language
			if ($l==0) {$lang="j";} elsif ($l==1) {$lang="k";} 
				elsif ($l==2) {$lang="c";} elsif ($l==3){$lang="t";}
			for ($i=0; $i<=1; $i++){#direction
				if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
				for ($first_hex=0x0; $first_hex <= 0xf; $first_hex++){
					$filename="utf$lang$face".sprintf("%x",$first_hex)."-$dir";
					open(OUT, ">ovp/$filename.ovp")||die "$!";
					&fonthead;
					print OUT "   (FONTNAME otf-u$lang$face-$dir)\n";
					&fontfoot;
					&writechar($first_hex);
					close(OUT);
					system("ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
					unlink "vf/$filename.ofm";
				}
			}
		}
	}
}

sub fonthead {
print OUT <<END_OF_DATA;
(VTITLE JVF for UTF16)
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
}#2003/10/22 FONTAT 0.962216->1.0

sub writechar {
	($hex) = @_;
	for ($ku=1; $ku <= 79; $ku++){#2002/1/27 120->79
		for ($ten=1; $ten <= 94; $ten++){
			$jis=sprintf("%X", $ku*256 + $ten + 0x2020);
			if ($ku>=16 && $ku<=79 && $ten>=16 && $ten<=79){
				$uni=$hex*4096 + ($ku-16)*64 + ($ten-16);
			} else {
				$uni=0x3013;
			}
			$wd = ($lang eq 'j' && $dir eq 'h' && $uni>=0xFF61 && $uni<=0xFF9F) ? '0.5' : '1.0';
			$uni=sprintf("%X", $uni);
			print OUT "(CHARACTER H $jis (CHARWD R $wd) (MAP (SETCHAR H $uni)))\n";
		}
	}
}
