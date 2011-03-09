#!/usr/bin/perl
use List::Util qw(reduce);
use strict;

my @cIdList = (
    'environment1:record1:component1:version1',
    '',
    ':record2:component2:version2',
    'environment3:record3:component3:version3',
);

#map { print "$_\n" } @cIdList;

my @out = filter( sub { length( $_ ) > 0 }, @cIdList );

map { print "$_\n" } @out;

sub filter {
    my ( $cond, @coll ) = @_;
    my @out;
    map { push( @out, $_ ) if $cond->($_) } @coll;
    return @out;
}
