#!/usr/bin/perl -n -s

=head1 NAME

mkutf32list.pl

=head1 USAGE

mkutf32list.pl cid2code.txt > sp_jp_text.tex
mkutf32list.pl -style=utf cid2code.txt > sp_jp_utf.tex
mkutf32list.pl -style=kchar cid2code.txt > sp_jp_kchar.tex
mkutf32list.pl -style=list cid2code.txt > sp_list_j.txt
mkutf32list.pl -style=list-wo-collec cid2code.txt > sp_list_ja.txt
mkutf32list.pl -allrange cid2code.txt > sp_jp_text.tex

=head1 AUTHOR

Takuji Tanaka

=head1 NOTE

This software is a part of otfbeta-uptex (a.k.a. japanese-otf-uptex).

=cut

use strict;
use encoding 'utf8';

our ($style, $allrange);
our (@count, %reset_ch, $icollec, $cid2code, $line);
our ($col_utf32, @out);
our (@cid_max, $collection_n, $collection, $utfmac, $cmap, $source);

BEGIN{
    $line = 0;
    @count = ();
    %reset_ch = ();
    $icollec = 0;
    @out = ();
}

if (/cid2code/) {
    chomp;
    s/^# /# in /;
    $cid2code=$_;
    $cid2code=~s/^#/%/;
}

if ($.<8 && /((Adobe-(?:Japan|CNS|GB|Korea).*)-\d)\s/) {
    $collection_n=$1;
    $collection=$2;
    if ($collection =~ /cns/i)    {
	@cid_max = qw/-1 14098 17407 17600 18845 18964 19087 19155 19178/;
	$utfmac="UTFT"; $cmap="UniCNS-UTF32";
	$source="Adobe-CNS1-7/cid2code.txt"; }
    elsif ($collection =~ /gb/i)  {
	@cid_max = qw/-1 7716 9896 22126 22352 29063 30283/;
	$utfmac="UTFC"; $cmap="UniGB-UTF32";
	$source="Adobe-GB1-5/cid2code.txt"; }
    elsif ($collection =~ /kor/i) {
	@cid_max = qw/-1 9332 18154 18351/;
	$utfmac="UTFK"; $cmap="UniKS-UTF32";
	$source="Adobe-Korea1-2/cid2code.txt"; }
    else                          {
	@cid_max = qw/-1 8283 8358 8719 9353 15443 20316 23057/;
	$utfmac="UTF";  $cmap="UniJIS-UTF32";
	$source="Adobe-Japan1-6/cid2code.txt"; }
}

next if (/^#/);
$line++;
if ($line == 1) {
    print <<END;
%
% This file is generated from the data of $cmap
$cid2code
% for $collection_n
%
% Reference:
%   https://github.com/adobe-type-tools/cmap-resources/
%   $source
%
% A newer CMap may be required for some code points.
%
END
}
if (/^CID/) {
    my @header = split;
    my $i=0;
    foreach (@header) {
	if (/^Uni(JIS|KS|CNS|GB)-UTF32$/) {
	    $col_utf32 = $i;
	    last;
	}
	$i++
    }
    next;
}

my @list = split;
my $cid = $list[0];
my @utf32 = split ',', $list[$col_utf32];

foreach (@utf32) {
    s/^0+//;

    next if ($_ eq '*');
    next if ($_ =~ '^[1-7][0-9a-f]$|^.$');
    next if ($_ =~ 'v');
    tr/a-z/A-Z/;
    my $ch=hex($_);
    next if ($ch < 0x10000 && !$allrange);

    while(!($cid_max[$icollec+1]>=$cid && $cid>$cid_max[$icollec])) {
	$icollec++;
	if ($icollec>@cid_max) {
	    die "CID:$cid (Character $_) is out of range!!\n";
	}
    }
    if ($count[$icollec]==0) {
	$reset_ch{$ch}=$icollec;
    }
    $count[$icollec]++;
    push @out, $ch;
}


END {
    my ($i, $out, $ch);

    if ($style eq "list-wo-collec") { @out = sort(@out); }

    foreach $ch (@out) {
	if ($style eq "list-wo-collec") {}
	elsif (defined($reset_ch{$ch})) {
	    $i=0;
	    print "\n\n";
	    print "%" if ($style =~ /list/);
	    print "$collection-$reset_ch{$ch}";
	    print "\\\\" if ($style !~ 'list');
	    print "\n";
	}

	$i++;
	if    ($style =~ /utf/)   { $out=sprintf "\\${utfmac}{%X}", $ch; }
	elsif ($style =~ /kchar/) { $out=sprintf "\\kchar\"%X", $ch; }
	elsif ($style =~ /list/)  { $out=sprintf "%X", $ch; }
	else                      { $out=chr($ch); }
	my ($newline);
	$newline = $allrange ? 25 : 10;
	if ($i % $newline != 1) {
	    print "," if ($style =~ /list/);
	}
	print $out;
	if ($i % $newline == 0) {
	    print "%" if ($style =~ /utf/);
	    print "\n" ;
	}
    }

    print "\n\n% end\n";
}
