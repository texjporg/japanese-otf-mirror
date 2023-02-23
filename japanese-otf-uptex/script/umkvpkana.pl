#!/usr/bin/perl -s

=head1 NOTE

This software is a part of japanese-otf-uptex.

=cut

use Encode;
use FindBin;
use lib "$FindBin::Bin";
use CheckDVICode;

if ($sp==1) { # supplemental plane
    use MakeSPList;
    &make_sp_char_list('j');
    %exist_char=%{$MakeSPList::r_exist_char->{'j'}};
}

$_=<DATA>;
while(<DATA>) {
	chomp($_);
	my (@data)=split(' ', $_);
	my ($char);
	last if (@data<6);
	$char = shift @data;
	push @character, $char;
	$cid    {$char}=shift @data;
	$min_w3 {$char}=shift @data;
	$min_w6 {$char}=shift @data;
	$goth_w3{$char}=shift @data;
	$goth_w6{$char}=shift @data;
	$maru_w4{$char}=shift @data;
}

@charwidth=({%min_w3}, {%min_w6}, {%goth_w3}, {%goth_w6}, {%maru_w4});
@font_name=("phiraminw3-v", "phiraminw6-v", "phirakakuw3-v", "phirakakuw6-v", "phiramaruw4-v");
@kanji_font_name=("hminr-v", "hminb-v", "hgothr-v", "hgothb-v", "hmgothr-v");
@kana_font_name=("hiramin-w3-v", "hiramin-w6-v", "hirakaku-w3-v", "hirakaku-w6-v", "hiramaru-w4-v");
$font_at=1.0;
$half_width= ($font_at / 2);
$quater_width= ($font_at / 4);
opendir(OVP, "ovp") || mkdir("ovp",0755) || die "cannot mkdir ovp";
opendir(VF, "vf") || mkdir("vf",0755) || die "cannot mkdir vf";
opendir(JPL, "pl") || mkdir("pl",0755) || die "cannot mkdir pl";
opendir(JFM, "tfm") || mkdir("tfm",0755) || die "cannot mkdir tfm";
closedir(OVP);
closedir(VF);
closedir(JPL);
closedir(JFM);

$ucs=1; # 1: upphiraXXX or 0: phiraXXX
if ($ucs) {
	$CheckDVICode::is_ucs=1;
	foreach(@font_name, @kanji_font_name) {
		$_="up$_";
	}
}

#main
for ($i=0; $i<=4; $i++){
	open (JPL, ">pl/$font_name[$i].pl");
	&tfm_head_v;
	&chars_in_type_jis;
	&chars_in_type_prop;
	&print_type_jis;
	&print_type_prop;
	&glue_kern;
	close(JPL);
}
for ($i=0; $i<=4; $i++){
	@cpm_v= $ucs ? (0x2F8D, 0x2F8E, 0x1F14, 0x1F15, 0x1ECF, 0x1ED0)
	             : (0x1ECF, 0x1ED0, 0x2F8D, 0x2F8E, 0x1F14, 0x1F15);
	open (OVP, ">ovp/$font_name[$i].ovp");
	&fonthead;
	&write_char;
	close(OVP);
}
#
#sub rtn
#
sub tfm_head_v {
	print  JPL "(DIRECTION TATE)\n";
	print  JPL "(FAMILY PROP KANA)\n";
	print  JPL "(FACE F MRR)\n";
	print  JPL "(CODINGSCHEME TEX KANJI TEXT)\n";
	print  JPL "(DESIGNSIZE R 10.0)\n";
	print  JPL "(CHECKSUM O 0)\n";
	print  JPL "(SEVENBITSAFEFLAG TRUE)\n";
	print  JPL "(FONTDIMEN\n";
	print  JPL "   (SLANT R 0.0)\n";
	print  JPL "   (SPACE R 0.0)\n";
	printf JPL "   (STRETCH R %f)\n", $font_at/10;
	print  JPL "   (SHRINK R 0.0)\n";
	printf JPL "   (XHEIGHT R %f)\n", $font_at;
	printf JPL "   (QUAD R %f)\n", $font_at;
	printf JPL "   (EXTRASPACE R %f)\n", $font_at/4;
	printf JPL "   (EXTRASTRETCH R %f)\n", $font_at/5;
	printf JPL "   (EXTRASHRINK R %f)\n", $font_at/8;
	print  JPL "   )\n";
}
sub char_foot_h {
	printf JPL "   (CHARHT R %f)\n", $font_at*0.88;
	printf JPL "   (CHARDP R %f)\n", $font_at*0.12;
	print  JPL "   )\n";
}
sub glue_kern{
	print  JPL "(GLUEKERN\n";
	print  JPL "   (LABEL O 5)\n";
	print  JPL "   (KRN O 5 R 0.0)\n";
	print  JPL "   (LABEL O 0)\n";
	for ($char=0; $char<=$#uniq_char_width_array; $char++){
		printf JPL "   (LABEL H %X)\n",($char+7);
	}
	printf JPL "   (GLUE O 1 R %f R 0.0 R %f)\n", $half_width, $half_width;
	print  JPL "   (LABEL O 1)\n";
	printf JPL "   (GLUE O 3 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	print  JPL "   (STOP)\n";
	print  JPL "   (LABEL O 2)\n";
	printf JPL "   (GLUE O 5 R %f R 0.0 R %f)\n", $half_width, $half_width;
	printf JPL "   (GLUE O 6 R %f R 0.0 R %f)\n", $half_width, $half_width;
	print  JPL "   (STOP)\n";
	print  JPL "   (LABEL O 6)\n";
	printf JPL "   (GLUE O 0 R %f R 0.0 R %f)\n", $half_width, $half_width;
	printf JPL "   (GLUE O 1 R %f R 0.0 R %f)\n", $half_width, $half_width;
	printf JPL "   (GLUE O 3 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	for ($char=0; $char<=$#uniq_char_width_array; $char++){
		printf JPL "   (GLUE H %X R %f R 0.0 R %f)\n",($char+7), $half_width, $half_width;
	}
	print  JPL "   (STOP)\n";
	print  JPL "   (LABEL O 4)\n";
	printf JPL "   (GLUE O 0 R %f R 0.0 R 0.0)\n", $half_width;
	printf JPL "   (GLUE O 1 R %f R 0.0 R 0.0)\n", $half_width;
	printf JPL "   (GLUE O 3 R %f R 0.0 R %f)\n", $half_width+$quater_width, $quater_width;
	printf JPL "   (GLUE O 5 R %f R 0.0 R 0.0)\n", $half_width;
	printf JPL "   (GLUE O 6 R %f R 0.0 R 0.0)\n", $half_width;
	for ($char=0; $char<=$#uniq_char_width_array; $char++){
		printf JPL "   (GLUE H %X R %f R 0.0 R 0.0)\n",($char+7), $half_width;
	}
	print  JPL "   (STOP)\n";
	print  JPL "   (LABEL O 3)\n";
	printf JPL "   (GLUE O 0 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	printf JPL "   (GLUE O 1 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	printf JPL "   (GLUE O 2 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	printf JPL "   (GLUE O 3 R %f R 0.0 R %f)\n", $half_width, $quater_width;
	printf JPL "   (GLUE O 4 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	printf JPL "   (GLUE O 5 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	printf JPL "   (GLUE O 6 R %f R 0.0 R %f)\n", $quater_width, $quater_width;
	for ($char=0; $char<=$#uniq_char_width_array; $char++){
		printf JPL "   (GLUE H %X R %f R 0.0 R %f)\n",($char+7), $quater_width, $quater_width;
	}
	print  JPL "   (STOP)\n";
	print  JPL "   )\n";
}
sub chars_in_type_jis{
	my ($type1add, $type2add, $type3add, $type5, $type6add)=();
	if ($ucs) {
		$type1add = "UFF5F U3018 U3016 U301D U00AB U2329 U301A";
		$type2add = "UFF60 U3019 U3017 U301F U00BB U232A U301B U301E";
		$type3add = "U00B7";
		$type5 = "— ― … ‥";
		$type6add = "U203C U2047 U2048 U2049";
	} else {
		$type5 = "— … ‥";
	}
print JPL <<END_OF_DATA;
(CHARSINTYPE O 1
   ‘ “ （ 〔 ［ ｛ 〈 《 「 『 【 
   $type1add 
   )
(CHARSINTYPE O 2
   、 ， ’ ” ） 〕 ］ ｝ 〉 》 」 』 】 
   $type2add 
   )
(CHARSINTYPE O 3
   ・ ： ； 
   $type3add 
   )
(CHARSINTYPE O 4
   。 ． 
   )
(CHARSINTYPE O 5
   $type5 
   )
(CHARSINTYPE O 6
   ？ ！ 
   $type6add 
   )
END_OF_DATA
}
sub print_type_jis{
	@type_width=($font_at, $half_width, $half_width, $half_width, $half_width, $font_at, $font_at);
	for ($k=0; $k<=6; $k++){
		printf  JPL "(TYPE H %x\n", $k;
		printf  JPL "   (CHARWD R %f)\n", $type_width[$k];
		&char_foot_h;
	}
}
sub fonthead {
	print  OVP "(VTITLE Prop Kana)\n";
	print  OVP "(OFMLEVEL D 0)\n";
	print  OVP "(DESIGNSIZE R 10.000000)\n";
	print  OVP "(CHECKSUM O 0)\n";
	print  OVP "(MAPFONT D 1\n";
	print  OVP "   (FONTNAME $kanji_font_name[$i])\n";
	print  OVP "   (FONTCHECKSUM O 0)\n";
	printf OVP "   (FONTAT R %f)\n", $font_at;
	print  OVP "   (FONTDSIZE R 10.000000)\n";
	print  OVP "   )\n";
	print  OVP "(MAPFONT D 2\n";
	print  OVP "   (FONTNAME $kana_font_name[$i])\n";
	print  OVP "   (FONTCHECKSUM O 0)\n";
	printf OVP "   (FONTAT R %f)\n", $font_at;
	print  OVP "   (FONTDSIZE R 10.000000)\n";
	print  OVP "   )\n";
}
sub write_char {
    if (!$ucs) {
	for ($ku=1; $ku<=94; $ku++){
		for ($ten=1; $ten<=94; $ten++){
			$dvicode=($ku+32)*256+($ten+32);
			if ($ku==1){&print_kigo_char;}elsif($ku==4){&print_kana_char;}
			elsif($ku==5){&print_kana_char;}else{&print_char;}
		}
	}
    } else { # ucs
	$max_ucs= $sp ? 0x2FA1F : 0xFFFF;  # U+2FA1F: max of CJK Compatibility Ideographs Supplement
	for ($ucscode=0; $ucscode<=$max_ucs; $ucscode++){
		$CheckDVICode::dvicode=$dvicode=$ucscode;
		next unless (&is_ucs_jpn_range);
		if ($sp==1 && $ucscode>0xFFFF) {
			next unless ($exist_char{sprintf("%X",$ucscode)});
		}
		if   (&is_ucs_kigo){&print_kigo_char;}
		elsif(&is_ucs_hira || &is_dvicode('hira-yori')){&print_kana_char;}
		elsif(&is_ucs_kata || &is_dvicode('kata-koto')){&print_kana_char;}
#		elsif(&is_ucs_hankana && $hk_mode){&print_hankana_char;}
		else{&print_char;}
	}
    }
}
sub print_char{
	return if ($omitfw);
	printf OVP "(CHARACTER H %X\n", $dvicode;
	printf OVP "   (CHARWD R %f)\n", $font_at;
	print  OVP "   (MAP\n";
	printf OVP "      (SETCHAR H %X)\n",$dvicode;
	print  OVP "      )\n";
	print  OVP "   )\n";
}
sub print_kigo_char{
	my ($width,$cid);
	printf OVP "(CHARACTER H %X\n", $dvicode;
	if (&is_dvicode('quote') || &is_dvicode('kakko')){#Kakko
		$width=$half_width;
	} elsif (&is_dvicode('kutouten')){#Kutouten
		$width=$half_width;
	} elsif (&is_dvicode('odoriji')){#odoriji
		($width,$cid)=&get_charwidth($i,$dvicode);
		$width/=10;
	} else{
		$width=$font_at;
	}
	printf OVP "   (CHARWD R %f)\n", $width;
	print  OVP "   (MAP\n";
	if (&is_dvicode('odoriji')){#odoriji
		print  OVP "      (SELECTFONT D 2)\n";
	} elsif (&is_dvicode('comma') || &is_dvicode('period') || &is_dvicode('quote')){#Comma, Period, Minute
		print  OVP "      (SELECTFONT D 2)\n";
	}
	if (&is_dvicode('nakaten') || &is_dvicode('colon') || &is_dvicode('semicolon')){#colon, semicolon, nakaten
		printf OVP "      (MOVERIGHT R -%f)\n",$quater_width;}
	if ((&is_dvicode('quote') || &is_dvicode('kakko')) && &is_dvicode('open')){#Kakko
		printf OVP "      (MOVERIGHT R -%f)\n",$half_width;
	}
	if (&is_dvicode('odoriji')){#odoriji
		printf OVP "      (SETCHAR H %X)\n",$cid;
	} elsif (&is_dvicode('comma') || &is_dvicode('period') || &is_dvicode('quote')){#Comma, Period, Minute
		$cpmcode= shift(@cpm_v);
		printf OVP "      (SETCHAR H %X)\n",$cpmcode;
	} else {
		printf OVP "      (SETCHAR H %X)\n",$dvicode;
	}
	print  OVP "      )\n";
	print  OVP "   )\n";
}
sub print_kana_char{
	my ($width,$cid)=&get_charwidth($i,$dvicode);
	if ($width==0) {
		return &print_char;
	}
	$width/=10;
	printf OVP "(CHARACTER H %X\n", $dvicode;
	printf OVP "   (CHARWD R %f)\n", $width;
	print  OVP "   (MAP\n";
	print  OVP "      (SELECTFONT D 2)\n";
	printf OVP "      (SETCHAR H %X)\n",$cid;
	print  OVP "      )\n";
	print  OVP "   )\n";
}
sub chars_in_type_prop{
	%char_width_hash=();
	for ($j=0; $j<@character; $j++){
		my ($c0, $c1);
		$c0=$c1=$character[$j];
		if (!$ucs) {
			if (!Encode::from_to($c1,'utf-8','euc-jp', Encode::FB_QUIET)
			    || $c0 eq "〃"
			    || $c0 eq "〆") { next; }
		}
		$char_width_hash{$c0}=$charwidth[$i]{$c0}/10;
	}
	$x = '-';
	@uniq_char_width_array = grep( $_ ne $x && ($x = $_), sort values(%char_width_hash));
	for ($j=0; $j<=$#uniq_char_width_array; $j++){
		printf JPL "(CHARSINTYPE H %X\n",($j+7);
		print  JPL "   ";
		@char_in_this_type = ();
		while (($name, $value) = each(%char_width_hash)) {
			if ($value == $uniq_char_width_array[$j]){
				push(@char_in_this_type, $name);
			}
		}
		@char_in_this_type = sort @char_in_this_type;
		foreach $char_in_this(@char_in_this_type){
			print  JPL "$char_in_this ";#character
		}
		print  JPL "\n";
		print  JPL "   )\n";
	}
}
sub print_type_prop{
	for ($j=0; $j<=$#uniq_char_width_array; $j++){
		$char_width=$uniq_char_width_array[$j];
		printf JPL "(TYPE H %X\n", ($j+7);
		printf JPL "   (CHARWD R %f)\n", $char_width;
		&char_foot_h;
	}
}

sub get_charwidth{
	my ($i,$dvicode)=@_;
	my ($char,$t,$u,$l);

	if (!$ucs) {
		if ($dvicode>=0x2474 && $dvicode<=0x2476) {
			return 0;
		}
		$u = ($dvicode >> 8) & 0xFF | 0x80;
		$l =  $dvicode       & 0xFF | 0x80;
		$char = pack("C*",$u,$l);
		Encode::from_to($char,'euc-jp','utf-8');
	} else {
		$t = ($dvicode >>16) & 0xFF;
		$u = ($dvicode >> 8) & 0xFF;
		$l =  $dvicode       & 0xFF;
		$char = pack("C*",0x00,$t,$u,$l);
		Encode::from_to($char,'utf-32','utf-8');
	}
	if (!exists($charwidth[$i]{$char})) {
		return 0;
	}
	return ($charwidth[$i]{$char}, $cid{$char});
}


__DATA__
character  cid  min_w3  min_w6  goth_w3  goth_w6  maru_w4  comment
ヽ  15976  7.17  7.46  7.92  8.27  8.13
ヾ  15977  8.34  8.44  8.46  8.62  8.5
ゝ  15978  7.77  7.98  8.44  8.69  8.62
ゞ  15979  8.32  8.54  8.8  8.92  8.98
ー  15982  9.96  9.98  9.99  9.99  9.98
ぁ  15985  9.03  9.15  9.01  9.18  9.17
あ  15986  9.6  9.79  9.6  9.77  9.75
ぃ  15987  7.75  7.92  8.09  8.4  8.59
い  15988  8.19  8.47  8.46  8.8  8.83
ぅ  15989  9.42  9.47  8.97  9.2  9.19
う  15990  9.98  9.99  9.58  9.8  9.79
ぇ  15991  8.89  9.12  8.84  9.15  9.05
え  15992  9.47  9.74  9.42  9.7  9.59
ぉ  15993  8.65  8.89  8.86  9.06  9.08
お  15994  9.14  9.48  9.39  9.67  9.61
か  15995  8.99  9.24  9.26  9.47  9.45
が  15996  9.1  9.39  9.41  9.67  9.6
き  15997  9.71  9.93  9.73  9.88  9.82
ぎ  15998  9.71  9.86  9.8  9.96  9.92
く  15999  9.99  9.99  9.56  9.77  9.47
ぐ  16000  9.79  9.98  9.49  9.7  9.5
け  16001  9.52  9.64  9.54  9.79  9.66
げ  16002  9.76  9.82  9.56  9.76  9.62
こ  16003  9.26  9.47  9.38  9.67  9.57
ご  16004  9.44  9.6  9.23  9.6  9.49
さ  16005  9.67  9.84  9.67  9.85  9.77
ざ  16006  9.71  9.85  9.86  9.97  9.95
し  16007  9.42  9.53  9.38  9.53  9.53
じ  16008  9.63  9.74  9.71  9.86  9.72
す  16009  9.39  9.61  9.3  9.55  9.43
ず  16010  9.61  9.83  9.6  9.84  9.68
せ  16011  9.18  9.45  9.44  9.7  9.54
ぜ  16012  9.47  9.66  9.53  9.79  9.63
そ  16013  9.45  9.66  9.4  9.65  9.57
ぞ  16014  9.56  9.74  9.43  9.65  9.59
た  16015  9.23  9.47  9.39  9.59  9.59
だ  16016  9.48  9.68  9.59  9.81  9.72
ち  16017  9.61  9.78  9.63  9.81  9.68
ぢ  16018  9.67  9.8  9.85  9.97  9.92
っ  16019  7.96  8.04  8.23  8.47  8.6
つ  16020  8.24  8.42  8.62  8.87  8.98
づ  16021  8.99  9.15  9.26  9.44  9.42
て  16022  8.69  8.92  8.89  9.19  9.16
で  16023  8.76  8.95  8.92  9.19  9.23
と  16024  9.75  9.89  9.59  9.82  9.65
ど  16025  9.69  9.89  9.81  9.96  9.93
な  16026  9.48  9.66  9.48  9.65  9.62
に  16027  8.95  9.17  9.19  9.42  9.4
ぬ  16028  8.98  9.23  9.34  9.57  9.49
ね  16029  9.25  9.54  9.52  9.68  9.62
の  16030  8.82  8.99  9.02  9.28  9.24
は  16031  9.28  9.55  9.5  9.75  9.66
ば  16032  9.57  9.76  9.67  9.82  9.76
ぱ  16033  9.7  9.82  9.84  9.97  9.92
ひ  16034  9.19  9.36  9.18  9.4  9.41
び  16035  9.46  9.64  9.4  9.61  9.61
ぴ  16036  9.72  9.8  9.71  9.79  9.81
ふ  16037  9.05  9.39  9.25  9.5  9.46
ぶ  16038  9.16  9.47  9.29  9.54  9.49
ぷ  16039  9.15  9.43  9.33  9.53  9.52
へ  16040  7.21  7.43  7.84  8.2  8.32
べ  16041  8.13  8.33  8.21  8.52  8.58
ぺ  16042  8.43  8.58  8.56  8.84  8.78
ほ  16043  9.23  9.46  9.45  9.71  9.67
ぼ  16044  9.61  9.74  9.65  9.89  9.79
ぽ  16045  9.65  9.81  9.7  9.9  9.87
ま  16046  9.76  9.88  9.57  9.74  9.64
み  16047  9.17  9.36  9.24  9.48  9.38
む  16048  9.37  9.58  9.49  9.71  9.64
め  16049  9.18  9.41  9.38  9.58  9.53
も  16050  9.76  9.91  9.48  9.68  9.6
ゃ  16051  8.69  8.83  8.89  9.1  8.99
や  16052  9.38  9.54  9.52  9.7  9.62
ゅ  16053  8.73  8.82  8.88  9.08  9.03
ゆ  16054  9.22  9.4  9.4  9.63  9.58
ょ  16055  8.95  9.17  9.03  9.28  9.09
よ  16056  9.63  9.83  9.63  9.82  9.61
ら  16057  9.66  9.82  9.5  9.74  9.79
り  16058  9.82  9.85  9.75  9.88  9.79
る  16059  9.59  9.8  9.55  9.77  9.7
れ  16060  9.21  9.43  9.4  9.59  9.55
ろ  16061  9.66  9.79  9.55  9.79  9.73
ゎ  16062  8.58  8.73  8.71  8.93  8.86
わ  16063  9.28  9.45  9.38  9.54  9.54
ゐ  16064  9.37  9.59  9.46  9.68  9.57
ゑ  16065  9.65  9.82  9.64  9.86  9.8
を  16066  9.64  9.79  9.62  9.83  9.71
ん  16067  9.2  9.4  9.32  9.54  9.45
ァ  16076  8.45  8.5  8.55  8.76  8.92
ア  16077  8.96  9.2  9.19  9.44  9.41
ィ  16078  8.81  8.92  8.63  8.88  8.75
イ  16079  9.29  9.46  9.28  9.48  9.35
ゥ  16080  8.89  8.93  8.82  9.03  8.94
ウ  16081  9.38  9.56  9.4  9.59  9.46
ェ  16082  7.81  8.04  8.33  8.65  8.84
エ  16083  8.12  8.39  8.77  9.06  9.3
ォ  16084  8.76  8.84  8.76  8.99  8.9
オ  16085  9.21  9.41  9.29  9.51  9.38
カ  16086  9.26  9.48  9.46  9.68  9.52
ガ  16087  9.27  9.5  9.66  9.79  9.71
キ  16088  9.25  9.41  9.4  9.6  9.39
ギ  16089  9.56  9.65  9.78  9.87  9.78
ク  16090  9.25  9.37  9.33  9.53  9.44
グ  16091  9.49  9.57  9.39  9.69  9.66
ケ  16092  9.19  9.32  9.14  9.35  9.37
ゲ  16093  9.6  9.65  9.47  9.59  9.64
コ  16094  8.32  8.59  9.13  9.4  9.4
ゴ  16095  8.83  9.13  9.52  9.78  9.7
サ  16096  9.17  9.37  9.34  9.53  9.49
ザ  16097  9.53  9.65  9.39  9.58  9.62
シ  16098  8.39  8.61  8.88  9.11  9.53
ジ  16099  9.1  9.21  9.31  9.39  9.84
ス  16100  8.61  8.85  9  9.3  9.22
ズ  16101  9.24  9.44  9.44  9.68  9.58
セ  16102  8.67  8.93  9.17  9.43  9.4
ゼ  16103  9.26  9.4  9.63  9.78  9.78
ソ  16104  8.89  9.06  8.98  9.21  9.12
ゾ  16105  9.52  9.64  9.56  9.63  9.61
タ  16106  9.31  9.42  9.41  9.6  9.56
ダ  16107  9.56  9.61  9.53  9.74  9.76
チ  16108  9.2  9.4  9.14  9.39  9.31
ヂ  16109  9.35  9.51  9.18  9.4  9.34
ッ  16110  8.33  8.43  8.55  8.77  8.77
ツ  16111  8.8  8.97  9.01  9.26  9.2
ヅ  16112  9.48  9.61  9.5  9.64  9.7
テ  16113  9.13  9.34  9.28  9.5  9.45
デ  16114  9.38  9.62  9.27  9.51  9.64
ト  16115  9.58  9.74  9.35  9.51  9.33
ド  16116  9.63  9.75  9.45  9.68  9.62
ナ  16117  9.11  9.35  9.08  9.37  9.31
ニ  16118  8.01  8.31  8.62  8.93  9.17
ヌ  16119  9.06  9.33  9.17  9.43  9.44
ネ  16120  9.45  9.64  9.53  9.73  9.49
ノ  16121  8.8  9.13  8.77  9.02  8.92
ハ  16122  7.42  7.65  8.71  9  8.97
バ  16123  8.16  8.44  8.82  9.07  9.34
パ  16124  8.55  8.74  9.09  9.23  9.44
ヒ  16125  8.79  9.06  9.33  9.51  9.46
ビ  16126  9.2  9.35  9.7  9.83  9.74
ピ  16127  9.39  9.55  9.83  9.92  9.89
フ  16128  8.91  9.06  9.01  9.29  9.28
ブ  16129  9.47  9.63  9.58  9.74  9.61
プ  16130  9.56  9.67  9.31  9.51  9.72
ヘ  16131  7.09  7.38  7.79  8.15  8.32
ベ  16132  8.05  8.32  8.3  8.5  8.59
ペ  16133  8.35  8.58  8.47  8.85  8.86
ホ  16134  9.07  9.32  9.47  9.71  9.5
ボ  16135  9.39  9.58  9.74  9.9  9.8
ポ  16136  9.64  9.73  9.83  9.98  9.92
マ  16137  8.1  8.38  8.95  9.19  9.16
ミ  16138  9.25  9.47  9.25  9.51  9.4
ム  16139  8.79  9.1  9.19  9.42  9.33
メ  16140  8.88  9.18  8.95  9.18  9.15
モ  16141  8.74  9  9.25  9.46  9.47
ャ  16142  8.52  8.68  8.79  8.94  8.88
ヤ  16143  8.98  9.19  9.37  9.53  9.41
ュ  16144  7.76  7.99  8.31  8.62  8.79
ユ  16145  8.09  8.33  8.7  9.01  9.25
ョ  16146  8.38  8.55  8.83  9.11  9.19
ヨ  16147  8.8  9.05  9.38  9.62  9.73
ラ  16148  9.29  9.47  9.35  9.64  9.61
リ  16149  9.75  9.89  9.64  9.84  9.69
ル  16150  8.5  8.83  9.33  9.58  9.42
レ  16151  8.35  8.71  9  9.18  9.17
ロ  16152  8.42  8.71  9.23  9.47  9.59
ヮ  16153  8.56  8.65  8.69  8.91  8.97
ワ  16154  9.03  9.15  9.21  9.43  9.47
ヰ  16155  9.35  9.58  9.31  9.59  9.42
ヱ  16156  8.34  8.65  8.95  9.25  9.41
ヲ  16157  9.17  9.39  9.27  9.49  9.49
ン  16158  8.11  8.3  8.51  8.78  8.79
ヴ  16159  9.47  9.62  9.49  9.69  9.63
ヵ  16160  8.73  8.9  8.93  9.11  9
ヶ  16161  8.53  8.64  8.41  8.66  8.69
〃  15980  8.16  8.40  8.74  8.90  8.88
〆  15981  8.94  9.09  8.99  9.14  9.04
ヿ  15983  9.36  9.59  9.59  9.75  9.74 
ゟ  15984  9.81  9.96  9.75  9.82  9.79
ゔ  16068  9.63  9.72  9.28  9.50  9.50
ゕ  16069  8.41  8.60  8.61  8.80  8.85
ゖ  16070  8.90  9.03  8.92  9.13  9.11
ㇰ  16170  8.65  8.67  8.78  8.94  8.92
ㇱ  16171  7.86  8.08  8.25  8.46  8.51
ㇲ  16172  8.22  8.40  8.57  8.80  8.77
ㇳ  16173  9.01  9.06  8.81  9.03  8.74
ㇴ  16174  8.51  8.65  8.64  8.94  8.93
ㇵ  16175  7.14  7.31  8.29  8.56  8.58
ㇶ  16176  8.29  8.52  8.76  9.00  8.90
ㇷ  16177  8.42  8.50  8.52  8.75  8.81
ㇸ  16178  6.79  7.01  7.32  7.65  7.81
ㇹ  16179  8.57  8.77  8.83  9.04  8.96
ㇺ  16181  8.34  8.62  8.66  8.90  8.81
ㇻ  16182  8.80  8.86  8.84  9.09  9.09
ㇼ  16183  9.13  9.22  8.99  9.23  9.14
ㇽ  16184  8.02  8.30  8.71  8.97  8.89
ㇾ  16185  7.89  8.08  8.41  8.66  8.59
ㇿ  16186  8.11  8.24  8.71  8.98  9.04
ヷ  16187  9.42  9.66  9.44  9.78  9.75
ヸ  16188  9.61  9.8  9.73  9.84  9.77
ヹ  16189  8.94  9.28  9.56  9.80  9.88
ヺ  16190  9.54  9.71  9.67  9.82  9.74
𛄲  16191  8.72  8.88  8.83  9.13  9.04  U+1B132 小書き「こ」
𛅕  16192  8     8.23  8.65  8.95  8.91  U+1B155 小書き「コ」
end
