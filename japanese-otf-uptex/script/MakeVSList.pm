package MakeVSList;

use strict;
use Exporter;
use File::Basename qw/dirname/;
our @ISA = qw(Exporter);
our @EXPORT = qw(make_var_seq_list);

=head1 NAME

MakeVSList.pm

=head1 NOTE

This software is a part of japanese-otf-uptex.

=cut

our ($r_ivd_list);

sub make_var_seq_list($;$) {
    my ($direction, $mode)=@_;
    my ($line, @data, $code, $mdf, $cid);
    my (@ivd_list, $ivs);

    @{$r_ivd_list} = ();

    $line = <DATA>;
    foreach $line (<DATA>) {
	chomp $line;
	@data = split ' ', $line;
	$code = hex($data[1]);
	$mdf  = hex($data[2]);
	if    ($mode eq 'expert') { $cid = $data[4]; }
	elsif ($mode eq 'ruby'  ) { $cid = $data[5]; }
	else                      { $cid = $data[3]; }
	if ( $cid =~ /:/) {
	    my (@cid) = split ':', $cid;
	    if ($direction eq "y"){ $cid = $cid[0]; }
	    if ($direction eq "t"){ $cid = $cid[1]; }
	}
	$code += (($mdf - 0x3099) << 17) + 0x220000;
	push @{$r_ivd_list}, ($code, $cid);
    }

    my $moduledir=dirname(__FILE__);

    # Ref. Ideographic Variation Database
    #   https://www.unicode.org/ivd/data/2022-09-13/IVD_Sequences.txt
    # We extract lines of Adobe-Japan1
    open(IVD, '<', "$moduledir/IVD_Sequences.txt") || die "$!";

    foreach $line (<IVD>) {
	next if ($line =~ /^#/);
	next if ($line !~ /Adobe-Japan1/);
	chomp $line;
	@data = split '[; ]+', $line;
	$code = hex($data[0]);
	$ivs  = hex($data[1]);
	$cid  = $data[3];
	$cid  =~ s/CID\+//;
	$code += (($ivs - 0xE0100) << 18) + 0x800000;
	push @{$r_ivd_list}, ($code, $cid);
    }
}

1;

__DATA__
UTF-8  base  modifier  fullwidth     tuned        ruby
か゚     304B  309A       16209        16352:16382  16414
き゚     304D  309A       16210        16353:16383  16415
く゚     304F  309A       16211        16354:16384  16416
け゚     3051  309A       16212        16355:16385  16417
こ゚     3053  309A       16213        16356:16386  16418
カ゚     30AB  309A       16214        16357:16387  16419
キ゚     30AD  309A       16215        16358:16388  16420
ク゚     30AF  309A       16216        16359:16389  16421
ケ゚     30B1  309A       16217        16360:16390  16422
コ゚     30B3  309A       16218        16361:16391  16423
セ゚     30BB  309A       16219        16362:16392  16424
ツ゚     30C4  309A       16220        16363:16393  16425
ト゚     30C8  309A       16221        16364:16394  16426
ㇷ゚     31F7  309A       16246:16343  16375:16405  16437:16460
