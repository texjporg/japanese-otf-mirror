package CheckDVICode;

use strict;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(is_dvicode is_ucs_open is_ucs_kigo is_ucs_hira
  is_ucs_kata is_ucs_hankana is_ucs_jpn_range);

=head1 NAME

CheckDVICode.pm

=head1 NOTE

This software is a part of otfbeta-uptex (a.k.a. japanese-otf-uptex).

=cut

our ($dvicode, $is_ucs);

sub is_dvicode($){
	my ($key)=@_;
	my ($code)=($dvicode);

    if (!$is_ucs) {
	if ($key eq 'hira-a')   { return ($code == 0x2421);}
	if ($key eq 'hira-i')   { return ($code == 0x2423);}
	if ($key eq 'hira-u')   { return ($code == 0x2425);}
	if ($key eq 'hira-e')   { return ($code == 0x2427);}
	if ($key eq 'hira-o')   { return ($code == 0x2429);}
	if ($key eq 'hira-tsu') { return ($code == 0x2443);}
	if ($key eq 'hira-ya')  { return ($code == 0x2463);}
	if ($key eq 'hira-yu')  { return ($code == 0x2465);}
	if ($key eq 'hira-yo')  { return ($code == 0x2467);}
	if ($key eq 'hira-wa')  { return ($code == 0x246E);}
	if ($key eq 'hira-Vu')  { return 0;                } # large  JIS X 0213
	if ($key eq 'hira-ka')  { return 0;                } # small  JIS X 0213
	if ($key eq 'hira-ke')  { return 0;                } # small  JIS X 0213
	if ($key eq 'kata-a')   { return ($code == 0x2521);}
	if ($key eq 'kata-i')   { return ($code == 0x2523);}
	if ($key eq 'kata-u')   { return ($code == 0x2525);}
	if ($key eq 'kata-e')   { return ($code == 0x2527);}
	if ($key eq 'kata-o')   { return ($code == 0x2529);}
	if ($key eq 'kata-tsu') { return ($code == 0x2543);}
	if ($key eq 'kata-ya')  { return ($code == 0x2563);}
	if ($key eq 'kata-yu')  { return ($code == 0x2565);}
	if ($key eq 'kata-yo')  { return ($code == 0x2567);}
	if ($key eq 'kata-wa')  { return ($code == 0x256E);}
	if ($key eq 'kata-ka')  { return ($code == 0x2575);}
	if ($key eq 'kata-ke')  { return ($code == 0x2576);}
	if ($key eq 'kata-Va')  { return 0;                } # large  JIS X 0213
	if ($key eq 'kata-Vi')  { return 0;                } # :      JIS X 0213
	if ($key eq 'kata-Ve')  { return 0;                } # :      JIS X 0213
	if ($key eq 'kata-Vo')  { return 0;                } # large  JIS X 0213
	if ($key eq 'kata-ku')  { return 0;                } # small  JIS X 0213
	if ($key eq 'kata-mu')  { return 0;                } # small  JIS X 0213
	if ($key eq 'kata-ku..ro')  { return 0;            } # small  JIS X 0213
	if ($key eq 'comma')  { return ($code == 0x2124);}
	if ($key eq 'period') { return ($code == 0x2125);}
	if ($key eq 'odoriji') { return 
		((0x2133 <= $code && $code <= 0x2136) || $code == 0x213C);}
	if ($key eq 'hira-odoriji') { return 
		($code == 0x2135 || $code == 0x2136);}
	if ($key eq 'kutouten') { return 
		($code>=0x2122 && $code<=0x2128);}
	if ($key eq 'burasage') { return 
		($code>=0x2122 && $code<=0x2125);}
	if ($key eq 'nakaten'  ) { return ($code == 0x2126);}
	if ($key eq 'colon'    ) { return ($code == 0x2127);}
	if ($key eq 'semicolon') { return ($code == 0x2128);}
	if ($key eq 'quote') { return 
		($code >= 0x2146 && $code <= 0x2149);}
	if ($key eq 's-quote') { return 
		($code == 0x2146 || $code == 0x2147);}
	if ($key eq 'd-quote') { return 
		($code == 0x2148 || $code == 0x2149);}
	if ($key eq 'kakko') { return 
		(0x214A <= $code && $code <= 0x215B);}
	if ($key eq 'open')  { return ($code%2==0);}
	if ($key eq 'close') { return ($code%2==1);}

	die "illegal keyname ($key)\n";
    } else { # ucs
	if ($key eq 'hira-a')   { return ($code == 0x3041);} # small
	if ($key eq 'hira-i')   { return ($code == 0x3043);} # :
	if ($key eq 'hira-u')   { return ($code == 0x3045);} # :
	if ($key eq 'hira-e')   { return ($code == 0x3047);} # :
	if ($key eq 'hira-o')   { return ($code == 0x3049);} # :
	if ($key eq 'hira-tsu') { return ($code == 0x3063);} # :
	if ($key eq 'hira-ya')  { return ($code == 0x3083);} # :
	if ($key eq 'hira-yu')  { return ($code == 0x3085);} # :
	if ($key eq 'hira-yo')  { return ($code == 0x3087);} # :
	if ($key eq 'hira-wa')  { return ($code == 0x308E);} # small
	if ($key eq 'hira-Vu')  { return ($code == 0x3094);} # large  JIS X 0213
	if ($key eq 'hira-ka')  { return ($code == 0x3095);} # small  JIS X 0213
	if ($key eq 'hira-ke')  { return ($code == 0x3096);} # small  JIS X 0213
	if ($key eq 'kata-a')   { return ($code == 0x30A1);} # small
	if ($key eq 'kata-i')   { return ($code == 0x30A3);} # :
	if ($key eq 'kata-u')   { return ($code == 0x30A5);} # :
	if ($key eq 'kata-e')   { return ($code == 0x30A7);} # :
	if ($key eq 'kata-o')   { return ($code == 0x30A9);} # :
	if ($key eq 'kata-tsu') { return ($code == 0x30C3);} # :
	if ($key eq 'kata-ya')  { return ($code == 0x30E3);} # :
	if ($key eq 'kata-yu')  { return ($code == 0x30E5);} # :
	if ($key eq 'kata-yo')  { return ($code == 0x30E7);} # :
	if ($key eq 'kata-wa')  { return ($code == 0x30EE);} # :
	if ($key eq 'kata-ka')  { return ($code == 0x30F5);} # :
	if ($key eq 'kata-ke')  { return ($code == 0x30F6);} # small
	if ($key eq 'kata-Va')  { return ($code == 0x30F7);} # large  JIS X 0213
	if ($key eq 'kata-Vi')  { return ($code == 0x30F8);} # :      JIS X 0213
	if ($key eq 'kata-Ve')  { return ($code == 0x30F9);} # :      JIS X 0213
	if ($key eq 'kata-Vo')  { return ($code == 0x30FA);} # large  JIS X 0213
	if ($key eq 'kata-ku')  { return ($code == 0x31F0);} # small  JIS X 0213
	if ($key eq 'kata-mu')  { return ($code == 0x31FA);} # small  JIS X 0213
	if ($key eq 'kata-ku..ro')  { return
		($code >= 0x31F0 && $code <= 0x31FF);}       # small  JIS X 0213
	if ($key eq 'comma')  { return ($code == 0xFF0C);}
	if ($key eq 'period') { return ($code == 0xFF0E);}
	if ($key eq 'odoriji') { return 
		($code == 0x30FD || $code == 0x30FE ||
		 $code == 0x309D || $code == 0x309E ||
		 $code == 0x30FC);}
	if ($key eq 'hira-odoriji') { return 
		($code == 0x309D || $code == 0x309E);}
	if ($key eq 'kutouten') { return 
		($code == 0x3001 || $code == 0x3002 ||
		 $code == 0xFF0C || $code == 0xFF0E ||
		 $code == 0x30FB || $code == 0x00B7 ||
		 $code == 0xFF1A || $code == 0xFF1B);}
	if ($key eq 'burasage') { return 
		($code == 0x3001 || $code == 0x3002 ||
		 $code == 0xFF0C || $code == 0xFF0E);}
	if ($key eq 'nakaten'  ) { return 
		($code == 0x30FB || $code == 0x00B7);}
	if ($key eq 'colon'    ) { return ($code == 0xFF1A);}
	if ($key eq 'semicolon') { return ($code == 0xFF1B);}
	if ($key eq 'quote') { return 
		($code == 0x2018 || $code == 0x2019 ||
		 $code == 0x201C || $code == 0x201D);}
	if ($key eq 's-quote') { return 
		($code == 0x2018 || $code == 0x2019);}
	if ($key eq 'd-quote') { return 
		($code == 0x201C || $code == 0x201D);}
	if ($key eq 'kakko') { return 
		((0x3008 <= $code && $code <= 0x3011) ||
		 $code == 0x3014 || $code == 0x3015 ||
		 $code == 0xFF08 || $code == 0xFF09 ||
		 $code == 0xFF3B || $code == 0xFF3D ||
		 $code == 0xFF5B || $code == 0xFF5D ||
		 $code == 0xFF5F || $code == 0xFF60 || # X0213 1-02-54,55
		 $code == 0x3018 || $code == 0x3019 || # X0213 1-02-56,57
		 $code == 0x3016 || $code == 0x3017 || # X0213 1-02-58,59
		 $code == 0x301D || $code == 0x301F || # X0213 1-13-64,65
		 $code == 0x00AB || $code == 0x00BB || # X0213 1-09-08,18
		 $code == 0x2329 || $code == 0x232A ||
		 $code == 0x301A || $code == 0x301B ||
		 $code == 0x301E
		);}
	if ($key eq 'open')  { return &is_ucs_open; }
	if ($key eq 'close') { return (!&is_ucs_open); }

	# ucs only
	if ($key eq 'hira-yori'){ return ($code == 0x309F);} # yori
	if ($key eq 'kata-koto'){ return ($code == 0x30FF);} # koto

	die "illegal keyname ($key)\n";
    }
}

sub is_ucs_open{
	if ($dvicode == 0x00AB || $dvicode == 0x2329
	 || $dvicode == 0x301D
	 || $dvicode == 0xFF3B || $dvicode == 0xFF5B
	 || $dvicode == 0xFF5F) { return 1;}
	if ($dvicode == 0x00BB || $dvicode == 0x232A
	 || $dvicode == 0x301E || $dvicode == 0x301F
	 || $dvicode == 0xFF3D || $dvicode == 0xFF5D
	 || $dvicode == 0xFF60) { return 0;}
	return ($dvicode%2==0);
}

sub is_ucs_kigo{
	return 1 if ($dvicode==0x00AB || $dvicode==0x00BB);
	return 1 if ($dvicode==0x00B7);
	return 1 if ($dvicode>=0x2018 && $dvicode<=0x2019);
	return 1 if ($dvicode>=0x201C && $dvicode<=0x201D);
	return 1 if ($dvicode>=0x2329 && $dvicode<=0x232A);
	return 1 if ($dvicode>=0x3001 && $dvicode<=0x301F);
	return 1 if ($dvicode>=0x3097 && $dvicode<=0x309E);
	return 1 if ($dvicode>=0x30FB && $dvicode<=0x30FE);
	return 1 if ($dvicode>=0xFF08 && $dvicode<=0xFF60);

	return 0;
}

sub is_ucs_hira{
	return 1 if ($dvicode>=0x3041 && $dvicode<=0x3093);
	return 1 if ($dvicode>=0x3094 && $dvicode<=0x3096); # Vu, small Ka, small Ke
#	return 1 if ($dvicode==0x309F); # Yori :: It is omitted because it is not included in "Tuned" in AJ1-6
	return 0;
}

sub is_ucs_kata{
	return 1 if ($dvicode>=0x30A1 && $dvicode<=0x30F6);
	return 1 if ($dvicode>=0x30F7 && $dvicode<=0x30FA); # Va, Vi, Ve, Vo
	return 1 if ($dvicode>=0x31F0 && $dvicode<=0x31FF); # small Ku, small Shi, ... , Small Re, Small Ro
#	return 1 if ($dvicode==0x30FF); # Koto :: It is omitted because it is not included in "Tuned" in AJ1-6
	return 0;
}

sub is_ucs_hankana{
	return 1 if ($dvicode>=0xFF61 && $dvicode<=0xFF9F);
	return 0;
}

# Reference:
#   http://www.unicode.org/Public/UNIDATA/Blocks.txt
#     Blocks-12.0.0.txt
#     Date: 2018-07-30, 19:40:00 GMT [KW]
sub is_ucs_jpn_range{
	return 1 if ($dvicode<=0x04FF); # Cyrillic

	return 0 if ($dvicode< 0x1E00);
	return 1 if ($dvicode<=0x243F); # Control Pictures

	return 0 if ($dvicode< 0x2460);
	return 1 if ($dvicode<=0x27BF); # Dingbats

	return 0 if ($dvicode< 0x2900);
	return 1 if ($dvicode<=0x29FF); # Miscellaneous Mathematical Symbols-B

	return 0 if ($dvicode< 0x2B00);
	return 1 if ($dvicode<=0x2BFF); # Miscellaneous Symbols and Arrows

	return 0 if ($dvicode< 0x2E80);
	return 1 if ($dvicode<=0x2FDF); # Kangxi Radicals

	return 0 if ($dvicode< 0x3000);
	return 1 if ($dvicode<=0x30FF); # Katakana

	return 0 if ($dvicode< 0x3190);
	return 1 if ($dvicode<=0x319F); # Kanbun

	return 0 if ($dvicode< 0x31F0);
	return 1 if ($dvicode<=0x4DBF); # CJK Unified Ideographs Extension A

	return 0 if ($dvicode< 0x4E00);
	return 1 if ($dvicode<=0x9FFF); # CJK Unified Ideographs

	return 0 if ($dvicode< 0xE000);
	return 1 if ($dvicode<=0xFB4F); # Alphabetic Presentation Forms

	return 0 if ($dvicode< 0xFE10);
	return 1 if ($dvicode<=0xFE1F); # Vertical Forms

	return 0 if ($dvicode< 0xFE30);
	return 1 if ($dvicode<=0xFE4F); # CJK Compatibility Forms

	return 0 if ($dvicode< 0xFF00);
	return 1 if ($dvicode<=0xFFEF); # Halfwidth and Fullwidth Forms

	return 0 if ($dvicode< 0x1B000);
	return 1 if ($dvicode<=0x1B0FF); # Kana Supplement
	return 1 if ($dvicode<=0x1B12F); # Kana Extended-A
	return 1 if ($dvicode<=0x1B16F); # Small Kana Extension

	return 0 if ($dvicode< 0x1F100);
	return 1 if ($dvicode<=0x1F1FF); # Enclosed Alphanumeric Supplement
	return 1 if ($dvicode<=0x1F2FF); # Enclosed Ideographic Supplement

	return 0 if ($dvicode< 0x1F780);
	return 1 if ($dvicode<=0x1F7FF); # Geometric Shapes Extended

	return 0 if ($dvicode< 0x20000);
	return 1 if ($dvicode<=0x2A6DF); # CJK Unified Ideographs Extension B
	return 1 if ($dvicode<=0x2B73F); # CJK Unified Ideographs Extension C
	return 1 if ($dvicode<=0x2B81F); # CJK Unified Ideographs Extension D
	return 1 if ($dvicode<=0x2CEAF); # CJK Unified Ideographs Extension E
	return 1 if ($dvicode<=0x2EBEF); # CJK Unified Ideographs Extension F

	return 0 if ($dvicode< 0x2F800);
	return 1 if ($dvicode<=0x2FA1F); # CJK Compatibility Ideographs Supplement

	return 0;
}

1;
