#!/usr/bin/perl -s

@min_w3=(7.17, 8.34, 7.77, 8.32, 9.96, 9.03, 9.60, 7.75, 8.19, 9.42, 9.98, 8.89, 9.47, 8.65, 9.14, 8.99, 9.10, 9.71, 9.71, 9.99, 9.79, 9.52, 9.76, 9.26, 9.44, 9.67, 9.71, 9.42, 9.63, 9.39, 9.61, 9.18, 9.47, 9.45, 9.56, 9.23, 9.48, 9.61, 9.67, 7.96, 8.24, 8.99, 8.69, 8.76, 9.75, 9.69, 9.48, 8.95, 8.98, 9.25, 8.82, 9.28, 9.57, 9.70, 9.19, 9.46, 9.72, 9.05, 9.16, 9.15, 7.21, 8.13, 8.43, 9.23, 9.61, 9.65, 9.76, 9.17, 9.37, 9.18, 9.76, 8.69, 9.38, 8.73, 9.22, 8.95, 9.63, 9.66, 9.82, 9.59, 9.21, 9.66, 8.58, 9.28, 9.37, 9.65, 9.64, 9.20, 8.45, 8.96, 8.81, 9.29, 8.89, 9.38, 7.81, 8.12, 8.76, 9.21, 9.26, 9.27, 9.25, 9.56, 9.25, 9.49, 9.19, 9.60, 8.32, 8.83, 9.17, 9.53, 8.39, 9.10, 8.61, 9.24, 8.67, 9.26, 8.89, 9.52, 9.31, 9.56, 9.20, 9.35, 8.33, 8.80, 9.48, 9.13, 9.38, 9.58, 9.63, 9.11, 8.01, 9.06, 9.45, 8.80, 7.42, 8.16, 8.55, 8.79, 9.20, 9.39, 8.91, 9.47, 9.56, 7.09, 8.05, 8.35, 9.07, 9.39, 9.64, 8.10, 9.25, 8.79, 8.88, 8.74, 8.52, 8.98, 7.76, 8.09, 8.38, 8.80, 9.29, 9.75, 8.50, 8.35, 8.42, 8.56, 9.03, 9.35, 8.34, 9.17, 8.11, 9.47, 8.73, 8.53);
@min_w6=(7.46, 8.44, 7.98, 8.54, 9.98, 9.15, 9.79, 7.92, 8.47, 9.47, 9.99, 9.12, 9.74, 8.89, 9.48, 9.24, 9.39, 9.93, 9.86, 9.99, 9.98, 9.64, 9.82, 9.47, 9.60, 9.84, 9.85, 9.53, 9.74, 9.61, 9.83, 9.45, 9.66, 9.66, 9.74, 9.47, 9.68, 9.78, 9.80, 8.04, 8.42, 9.15, 8.92, 8.95, 9.89, 9.89, 9.66, 9.17, 9.23, 9.54, 8.99, 9.55, 9.76, 9.82, 9.36, 9.64, 9.80, 9.39, 9.47, 9.43, 7.43, 8.33, 8.58, 9.46, 9.74, 9.81, 9.88, 9.36, 9.58, 9.41, 9.91, 8.83, 9.54, 8.82, 9.40, 9.17, 9.83, 9.82, 9.85, 9.80, 9.43, 9.79, 8.73, 9.45, 9.59, 9.82, 9.79, 9.40, 8.50, 9.20, 8.92, 9.46, 8.93, 9.56, 8.04, 8.39, 8.84, 9.41, 9.48, 9.50, 9.41, 9.65, 9.37, 9.57, 9.32, 9.65, 8.59, 9.13, 9.37, 9.65, 8.61, 9.21, 8.85, 9.44, 8.93, 9.40, 9.06, 9.64, 9.42, 9.61, 9.40, 9.51, 8.43, 8.97, 9.61, 9.34, 9.62, 9.74, 9.75, 9.35, 8.31, 9.33, 9.64, 9.13, 7.65, 8.44, 8.74, 9.06, 9.35, 9.55, 9.06, 9.63, 9.67, 7.38, 8.32, 8.58, 9.32, 9.58, 9.73, 8.38, 9.47, 9.10, 9.18, 9.00, 8.68, 9.19, 7.99, 8.33, 8.55, 9.05, 9.47, 9.89, 8.83, 8.71, 8.71, 8.65, 9.15, 9.58, 8.65, 9.39, 8.30, 9.62, 8.90, 8.64);
@goth_w3=(7.92, 8.46, 8.44, 8.80, 9.99, 9.01, 9.60, 8.09, 8.46, 8.97, 9.58, 8.84, 9.42, 8.86, 9.39, 9.26, 9.41, 9.73, 9.80, 9.56, 9.49, 9.54, 9.56, 9.38, 9.23, 9.67, 9.86, 9.38, 9.71, 9.30, 9.60, 9.44, 9.53, 9.40, 9.43, 9.39, 9.59, 9.63, 9.85, 8.23, 8.62, 9.26, 8.89, 8.92, 9.59, 9.81, 9.48, 9.19, 9.34, 9.52, 9.02, 9.50, 9.67, 9.84, 9.18, 9.40, 9.71, 9.25, 9.29, 9.33, 7.84, 8.21, 8.56, 9.45, 9.65, 9.70, 9.57, 9.24, 9.49, 9.38, 9.48, 8.89, 9.52, 8.88, 9.40, 9.03, 9.63, 9.50, 9.75, 9.55, 9.40, 9.55, 8.71, 9.38, 9.46, 9.64, 9.62, 9.32, 8.55, 9.19, 8.63, 9.28, 8.82, 9.40, 8.33, 8.77, 8.76, 9.29, 9.46, 9.66, 9.40, 9.78, 9.33, 9.39, 9.14, 9.47, 9.13, 9.52, 9.34, 9.39, 8.88, 9.31, 9.00, 9.44, 9.17, 9.63, 8.98, 9.56, 9.41, 9.53, 9.14, 9.18, 8.55, 9.01, 9.50, 9.28, 9.27, 9.35, 9.45, 9.08, 8.62, 9.17, 9.53, 8.77, 8.71, 8.82, 9.09, 9.33, 9.70, 9.83, 9.01, 9.58, 9.31, 7.79, 8.30, 8.47, 9.47, 9.74, 9.83, 8.95, 9.25, 9.19, 8.95, 9.25, 8.79, 9.37, 8.31, 8.70, 8.83, 9.38, 9.35, 9.64, 9.33, 9.00, 9.23, 8.69, 9.21, 9.31, 8.95, 9.27, 8.51, 9.49, 8.93, 8.41);
@goth_w6=(8.27, 8.62, 8.69, 8.92, 9.99, 9.18, 9.77, 8.40, 8.80, 9.20, 9.80, 9.15, 9.70, 9.06, 9.67, 9.47, 9.67, 9.88, 9.96, 9.77, 9.70, 9.79, 9.76, 9.67, 9.60, 9.85, 9.97, 9.53, 9.86, 9.55, 9.84, 9.70, 9.79, 9.65, 9.65, 9.59, 9.81, 9.81, 9.97, 8.47, 8.87, 9.44, 9.19, 9.19, 9.82, 9.96, 9.65, 9.42, 9.57, 9.68, 9.28, 9.75, 9.82, 9.97, 9.40, 9.61, 9.79, 9.50, 9.54, 9.53, 8.20, 8.52, 8.84, 9.71, 9.89, 9.90, 9.74, 9.48, 9.71, 9.58, 9.68, 9.10, 9.70, 9.08, 9.63, 9.28, 9.82, 9.74, 9.88, 9.77, 9.59, 9.79, 8.93, 9.54, 9.68, 9.86, 9.83, 9.54, 8.76, 9.44, 8.88, 9.48, 9.03, 9.59, 8.65, 9.06, 8.99, 9.51, 9.68, 9.79, 9.60, 9.87, 9.53, 9.69, 9.35, 9.59, 9.40, 9.78, 9.53, 9.58, 9.11, 9.39, 9.30, 9.68, 9.43, 9.78, 9.21, 9.63, 9.60, 9.74, 9.39, 9.40, 8.77, 9.26, 9.64, 9.50, 9.51, 9.51, 9.68, 9.37, 8.93, 9.43, 9.73, 9.02, 9.00, 9.07, 9.23, 9.51, 9.83, 9.92, 9.29, 9.74, 9.51, 8.15, 8.50, 8.85, 9.71, 9.90, 9.98, 9.19, 9.51, 9.42, 9.18, 9.46, 8.94, 9.53, 8.62, 9.01, 9.11, 9.62, 9.64, 9.84, 9.58, 9.18, 9.47, 8.91, 9.43, 9.59, 9.25, 9.49, 8.78, 9.69, 9.11, 8.66);
@maru_w4=(8.13, 8.50, 8.62, 8.98, 9.98, 9.17, 9.75, 8.59, 8.83, 9.19, 9.79, 9.05, 9.59, 9.08, 9.61, 9.45, 9.60, 9.82, 9.92, 9.47, 9.50, 9.66, 9.62, 9.57, 9.49, 9.77, 9.95, 9.53, 9.72, 9.43, 9.68, 9.54, 9.63, 9.57, 9.59, 9.59, 9.72, 9.68, 9.92, 8.60, 8.98, 9.42, 9.16, 9.23, 9.65, 9.93, 9.62, 9.40, 9.49, 9.62, 9.24, 9.66, 9.76, 9.92, 9.41, 9.61, 9.81, 9.46, 9.49, 9.52, 8.32, 8.58, 8.78, 9.67, 9.79, 9.87, 9.64, 9.38, 9.64, 9.53, 9.60, 8.99, 9.62, 9.03, 9.58, 9.09, 9.61, 9.79, 9.79, 9.70, 9.55, 9.73, 8.86, 9.54, 9.57, 9.80, 9.71, 9.45, 8.92, 9.41, 8.75, 9.35, 8.94, 9.46, 8.84, 9.30, 8.90, 9.38, 9.52, 9.71, 9.39, 9.78, 9.44, 9.66, 9.37, 9.64, 9.40, 9.70, 9.49, 9.62, 9.53, 9.84, 9.22, 9.58, 9.40, 9.78, 9.12, 9.61, 9.56, 9.76, 9.31, 9.34, 8.77, 9.20, 9.70, 9.45, 9.64, 9.33, 9.62, 9.31, 9.17, 9.44, 9.49, 8.92, 8.97, 9.34, 9.44, 9.46, 9.74, 9.89, 9.28, 9.61, 9.72, 8.32, 8.59, 8.86, 9.50, 9.80, 9.92, 9.16, 9.40, 9.33, 9.15, 9.47, 8.88, 9.41, 8.79, 9.25, 9.19, 9.73, 9.61, 9.69, 9.42, 9.17, 9.59, 8.97, 9.47, 9.42, 9.41, 9.49, 8.79, 9.63, 9.00, 8.69);
@charwidth=([@min_w3], [@min_w6], [@goth_w3], [@goth_w6], [@maru_w4]);
@character=("ヽ", "ヾ", "ゝ", "ゞ", "ー", "ぁ", "あ", "ぃ", "い", "ぅ", "う", "ぇ", "え", "ぉ", "お", "か", "が", "き", "ぎ", "く", "ぐ", "け", "げ", "こ", "ご", "さ", "ざ", "し", "じ", "す", "ず", "せ", "ぜ", "そ", "ぞ", "た", "だ", "ち", "ぢ", "っ", "つ", "づ", "て", "で", "と", "ど", "な", "に", "ぬ", "ね", "の", "は", "ば", "ぱ", "ひ", "び", "ぴ", "ふ", "ぶ", "ぷ", "へ", "べ", "ぺ", "ほ", "ぼ", "ぽ", "ま", "み", "む", "め", "も", "ゃ", "や", "ゅ", "ゆ", "ょ", "よ", "ら", "り", "る", "れ", "ろ", "ゎ", "わ", "ゐ", "ゑ", "を", "ん", "ァ", "ア", "ィ", "イ", "ゥ", "ウ", "ェ", "エ", "ォ", "オ", "カ", "ガ", "キ", "ギ", "ク", "グ", "ケ", "ゲ", "コ", "ゴ", "サ", "ザ", "シ", "ジ", "ス", "ズ", "セ", "ゼ", "ソ", "ゾ", "タ", "ダ", "チ", "ヂ", "ッ", "ツ", "ヅ", "テ", "デ", "ト", "ド", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "バ", "パ", "ヒ", "ビ", "ピ", "フ", "ブ", "プ", "ヘ", "ベ", "ペ", "ホ", "ボ", "ポ", "マ", "ミ", "ム", "メ", "モ", "ャ", "ヤ", "ュ", "ユ", "ョ", "ヨ", "ラ", "リ", "ル", "レ", "ロ", "ヮ", "ワ", "ヰ", "ヱ", "ヲ", "ン", "ヴ", "ヵ", "ヶ");
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
	@prop_odori_v=(0x3E68, 0x3E69, 0x3E6A, 0x3E6B, 0x3E6E);
	@cpm_v=(0x1ECF, 0x01ED0, 0x2F8D, 0x2F8E, 0x1F14, 0x1F15);
	$hiracode=15985;
	$katacode=16076;
	$prop_char_num=0;
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
print JPL <<END_OF_DATA;
(CHARSINTYPE O 1
   ‘ “ （ 〔 ［ ｛ 〈 《 「 『 【 
   )
(CHARSINTYPE O 2
   、 ， ’ ” ） 〕 ］ ｝ 〉 》 」 』 】 
   )
(CHARSINTYPE O 3
   ・ ： ； 
   )
(CHARSINTYPE O 4
   。 ． 
   )
(CHARSINTYPE O 5
   ― … ‥ 
   )
(CHARSINTYPE O 6
   ？ ！ 
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
	for ($ku=1; $ku<=94; $ku++){
		for ($ten=1; $ten<=94; $ten++){
			$jiscode=($ku+32)*256+($ten+32);
			if ($ku==1){&print_kigo_char;}elsif($ku==4){&print_hira_char;}
			elsif($ku==5){&print_kata_char;}else{&print_char;}
		}
	}
}
sub print_char{
	return if ($omitfw);
	$jiscode=($ku+32)*256+($ten+32);
	printf OVP "(CHARACTER H %X\n", $jiscode;
	printf OVP "   (CHARWD R %f)\n", $width;
	print  OVP "   (MAP\n";
	printf OVP "      (SETCHAR H %X)\n",$jiscode;
	print  OVP "      )\n";
	print  OVP "   )\n";
}
sub print_kigo_char{
	printf OVP "(CHARACTER H %X\n", $jiscode;
	if ($jiscode>=0x2146 && $jiscode<=0x215B){#Kakko
		$width=$half_width;
	} elsif ($jiscode>=0x2122 && $jiscode<=0x2128){#Kutouten
		$width=$half_width;
	} elsif ((0x2133 <= $jiscode && $jiscode <= 0x2136) || $jiscode == 0x213c){#odoriji
		$width=($charwidth[$i][$prop_char_num]/10);
		$prop_char_num++;
	} else{
		$width=$font_at;
	}
	printf OVP "   (CHARWD R %f)\n", $width;
	print  OVP "   (MAP\n";
	if ((0x2133 <= $jiscode && $jiscode <= 0x2136) || $jiscode == 0x213c){#Odoriji, Cho-on
		print  OVP "      (SELECTFONT D 2)\n";
	} elsif ((0x2124 <= $jiscode && $jiscode <= 0x2125) || (0x2146 <= $jiscode && $jiscode <= 0x2149)){#Comma, Period, Minute
		print  OVP "      (SELECTFONT D 2)\n";
	}
	if (0x2126 <= $jiscode && $jiscode <= 0x2128){#colon, semicolon, nakaten
		printf OVP "      (MOVERIGHT R -%f)\n",$quater_width;}
	if (0x2146 <= $jiscode && $jiscode <= 0x215B && ($jiscode%2)==0){#Kakko
		printf OVP "      (MOVERIGHT R -%f)\n",$half_width;
	}
	if ((0x2133 <= $jiscode && $jiscode <= 0x2136) || $jiscode == 0x213c){#odoriji
		$odorijicode= shift(@prop_odori_v);
		printf OVP "      (SETCHAR H %X)\n",$odorijicode;
	} elsif((0x2124 <= $jiscode && $jiscode <= 0x2125) || (0x2146 <= $jiscode && $jiscode <= 0x2149)){#Comma, Period, Minute
		$cpmcode= shift(@cpm_v);
		printf OVP "      (SETCHAR H %X)\n",$cpmcode;
	} else {
		printf OVP "      (SETCHAR H %X)\n",$jiscode;
	}
	print  OVP "      )\n";
	print  OVP "   )\n";
}
sub print_hira_char{
	$width=($charwidth[$i][$prop_char_num]/10);
	printf OVP "(CHARACTER H %X\n", $jiscode;
	printf OVP "   (CHARWD R %f)\n", $width;
	print  OVP "   (MAP\n";
	print  OVP "      (SELECTFONT D 2)\n";
	printf OVP "      (SETCHAR H %X)\n",$hiracode;
	print  OVP "      )\n";
	print  OVP "   )\n";
	$hiracode++;
	if($ten<=83){$prop_char_num++;}
}
sub print_kata_char{
	$width=($charwidth[$i][$prop_char_num]/10);
	printf OVP "(CHARACTER H %X\n", $jiscode;
	printf OVP "   (CHARWD R %f)\n", $width;
	print  OVP "   (MAP\n";
	print  OVP "      (SELECTFONT D 2)\n";
	printf OVP "      (SETCHAR H %X)\n",$katacode;
	print  OVP "      )\n";
	print  OVP "   )\n";
	$katacode++;
	$prop_char_num++;
}
sub chars_in_type_prop{
	%char_width_hash=();
	for ($j=0; $j<=$#min_w3; $j++){
		$char_width_hash{$character[$j]}=$charwidth[$i][$j]/10;
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
