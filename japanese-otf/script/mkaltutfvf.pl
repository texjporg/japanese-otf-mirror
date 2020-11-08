open(GLYPH, "<glyphdata")||open(GLYPH, "<script/glyphdata");
binmode(GLYPH);
@glyph_sub_table=();
opendir(OVP, "ovp") || mkdir("ovp",0755) || die "cannot mkdir ovp";
opendir(VF, "vf") || mkdir("vf",0755) || die "cannot mkdir vf";
closedir(OVP);
closedir(VF);

&make_glyph_substitute_array;
&make_uni_vf;

#
# dfn of sub rtns.
#
sub make_glyph_substitute_array {
	for ($j=0x0000; $j<=0xffff; $j=$j+2){
		read(GLYPH, $hex_data, 1);
		$hex_data= unpack("C", $hex_data);
		$high=$hex_data >> 4;
		$low=$hex_data-($high*16);
		&write_cjkt($high);
		&write_cjkt($low);
	}
}
sub make_uni_vf {
	for ($k=0; $k<=1; $k++){#face
		if ($k==0) {$face="mr";}elsif ($k==1){$face="gr";}elsif ($k==2){$face="mb";}
			elsif ($k==3){$face="gb";}elsif ($k==4){$face="mgr";}elsif ($k==5){$face="ml";}
			elsif ($k==6){$face="ge";}
		for ($i=0; $i<=1; $i++){#direction
			if ($i==0) {$dir="h";}elsif ($i==1){$dir="v";}
			for ($first_hex=0x0; $first_hex <= 0xf; $first_hex++){
				$filename="utf$face".sprintf("%x",$first_hex)."-$dir";
				open(OVP, ">ovp/$filename.ovp")||die "$!";
				&fonthead;
				for ($l=0; $l<=3; $l++){#language
					if ($l==0) {$lang="j";} elsif ($l==1) {$lang="k";} elsif ($l==2) {$lang="c";} elsif ($l==3){$lang="t";}
					print OVP "(MAPFONT D $l\n   (FONTNAME otf-u$lang$face-$dir)\n";
					&fontfoot;
				}
				&writechar;
				close(OVP);
				system("ovp2ovf ovp/$filename.ovp vf/$filename.vf vf/$filename.ofm");
				unlink "vf/$filename.ofm";
			}
		}
	}
}
sub fonthead {
print OVP <<END_OF_DATA;
(VTITLE JVF for UTF16)
(OFMLEVEL D 0)
(DESIGNSIZE R 10.000000)
(CHECKSUM O 0)
END_OF_DATA
}

sub fontfoot {
print OVP <<END_OF_DATA;
   (FONTCHECKSUM O 0)
   (FONTAT R 1.0)
   (FONTDSIZE R 10.000000)
   )
END_OF_DATA
}#2003/10/22 FONTAT 0.962216->1.0
sub writechar {
	for ($ku=1; $ku <= 79; $ku++){#2002/1/27 120->79
		for ($ten=1; $ten <= 94; $ten++){
			if ($ku>=16 && $ku<=79 && $ten>=16 && $ten<=79){
				&printchar($first_hex,$ku,$ten);
			} else {
				&printgeta($first_hex,$ku,$ten);
			}
		}
	}
}

sub printchar {
	$jiscode=($_[1]+0x20)*256+($_[2]+0x20);
	$unicode=$_[0]*4096+($_[1]-16)*64+($_[2]-16);
	printf OVP "(CHARACTER H %X\n", $jiscode;
	print  OVP "   (CHARWD R 1.0)\n";#2003/10/22 CHARWD 0.962216->1.0
	print  OVP "   (MAP\n";
	&write_map_font;
	printf OVP "      (SETCHAR H %X)\n", $unicode;
	print  OVP "      )\n";
	print  OVP "   )\n";
}

sub printgeta {
	$jiscode=($_[1]+0x20)*256+($_[2]+0x20);
	printf OVP "(CHARACTER H %X\n", $jiscode;
	print  OVP "   (CHARWD R 1.0)\n";#2003/10/22 CHARWD 0.962216->1.0
	print  OVP "   (MAP\n";
	print  OVP "      (SETCHAR H 3013)\n";
	print  OVP "      )\n";
	print  OVP "   )\n";
}
sub write_map_font{
	if ($glyph_sub_table[$unicode] eq "c"){
		print OVP "      (SELECTFONT D 2)\n";
	}elsif($glyph_sub_table[$unicode] eq "t"){
		print OVP "      (SELECTFONT D 3)\n";
	}elsif($glyph_sub_table[$unicode] eq "k"){
		print OVP "      (SELECTFONT D 1)\n";
	}
}
sub write_cjkt{
	if ($_[0]>=8 || $_[0]==0){
		push(@glyph_sub_table,"j");
	}elsif(4<=$_[0] && $_[0]<8){
		push(@glyph_sub_table,"c");
	}elsif(2<=$_[0] && $_[0]<4){
		push(@glyph_sub_table,"t");
	}elsif($_[0]==1){
		push(@glyph_sub_table,"k");
	}
}
