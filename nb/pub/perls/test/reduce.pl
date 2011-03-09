#!/usr/bin/perl
use List::Util qw(reduce);
use strict;

my @cIdList = (
    'environment1:record1:component1:version1',
    ':record2:component2:version2',
    'environment3:record3:component3:version3',
);

my $out = reduce( sub { compEnv($b) unless compEnv($a) }, @cIdList );

print "$out\n";

sub compEnv {
	my $c = shift;
	my ($cEnv, $crec, $pCompName, $templVers) = split ':', $c;
	return $cEnv;
}
