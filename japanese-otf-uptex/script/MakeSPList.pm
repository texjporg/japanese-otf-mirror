package MakeSPList;

use strict;
use Exporter;
use File::Basename qw/dirname/;
our @ISA = qw(Exporter);
our @EXPORT = qw(make_sp_char_list);

=head1 NAME

MakeSPList.pm

=head1 NOTE

This software is a part of otfbeta-uptex (a.k.a. japanese-otf-uptex).

=cut

our ($r_exist_head, $r_exist_char);

my $num = '[12][0-9A-F]{4}';

sub make_sp_char_list(@) {
    my (@lang)=@_;
    my (@exist_head_mul, %exist_char_mul)=();
    my ($lang, $first_hex);

    my $moduledir=dirname(__FILE__);

    foreach $lang (@lang) {
	open(LIST, "$moduledir/sp_list_$lang.txt") || die "$!";
	my (@exist_head_each, %exist_char_each)=();
	while (<LIST>) {
	    chomp;
	    s/\s+//g;
	    next if (/^[#%]/);
	    s/[#%].*$//;
	    s/,$//;
	    my @tmp;
	    foreach $_ (split ',', $_) {
		if (/^($num)$/io) {
		    @tmp = (hex($1));
		} elsif (/^($num)-($num)$/io) {
		    @tmp = (hex($1)..hex($2));
		} else {
		    die "input [$_] is not expected\n";
		}
		foreach $_ (@tmp) {
		    my $HEX=sprintf("%X",$_);
		    $first_hex=int($_/0x1000);
		    $exist_head_each[$first_hex]++;
		    $exist_char_each{$HEX}=1;
		    if ($exist_char_mul{$HEX} eq '' && $exist_head_mul[$first_hex]!~/$lang/) {
			$exist_head_mul[$first_hex].=$lang;
		    }
		    $exist_char_mul{$HEX}.=$lang;
#		    warn "$HEX $first_hex ",sprintf("%X",$first_hex),"\n";
		}
	    }
	}
	@{$r_exist_head->{$lang}}=@exist_head_each;
	%{$r_exist_char->{$lang}}=%exist_char_each;
    }
    if (@lang>1) {
	$lang = join ',', @lang;
	@{$r_exist_head->{$lang}}=@exist_head_mul;
	%{$r_exist_char->{$lang}}=%exist_char_mul;
    }
}

1;
