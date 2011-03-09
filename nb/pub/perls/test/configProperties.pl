#!/usr/bin/perl
use English qw(-no_match_vars);    # Avoids regex performance penalty
use List::Util qw(reduce);
use strict;

# Set the names of the properties in which to look for the actual names
# of the data projects and configuration items.
$::gBRODataPointerProperty      = "broDataProject";
$::gTemplateDataPointerProperty = "templateDataProject";
$::gDebugLevelProperty          = "debugLevel";
$::gNotifierProcedureProperty   = "notifierProcedure";
$::gLibraryProjectProperty      = "broLibProject";
$::gFlagsProperty               = "broFlags";

main();

sub main {
    my @configProperties = (
        {   propertyName => "$::gBRODataPointerProperty",
            gVarName     => '::gBRODataProject',
        },
        {   propertyName => "$::gTemplateDataPointerProperty",
            gVarName     => '::gTemplateDataProject',
        },
        {   propertyName => "$::gDebugLevelProperty",
            gVarName     => '::gDebugLevel',
        },
        {   propertyName => "$::gNotifierProcedureProperty",
            gVarName     => '::gNotifierProcedure',
        },
        {   propertyName => "$::gLibraryProjectProperty",
            gVarName     => '::gLibraryProject',
        },
        { propertyName => "$::gFlagsProperty", gVarName => '::gFlags', },

        #{propertyName => "$::gCacheDirProperty", gVarName => '::gCacheDir',},
    );

    foreach my $configProperty (@configProperties) {
        my $propertyNameToGet = $configProperty->{propertyName};
        print "$propertyNameToGet $configProperty->{gVarName}\n";
    }

    print "\n";

    map { printConfigProperty($_) } @configProperties;

    print "\n";

    my $count = 0;
    reduce( sub { $count = $count + 1 }, @configProperties );
    print "$count\n";
    my @cpLens = map { length $_->{propertyName} } @configProperties;
    my $cpLen = reduce( sub { $a + $b }, @cpLens );
    print "$cpLen\n";

    print "\n";

    map { setGlobalVar($_) } @configProperties;

    print "\$::gBRODataProject = $::gBRODataProject\n";
    print "\$::gTemplateDataProject = $::gTemplateDataProject\n";
    print "\$::gDebugLevel = $::gDebugLevel\n";
    print "\$::gNotifierProcedure = $::gNotifierProcedure\n";
    print "\$::gLibraryProject = $::gLibraryProject\n";

    print "\n";

    my @cpNames = map { propertyName($_) } @configProperties;

    my @lengths = map {length} @cpNames;

    #map { println($_) } @lengths;

    #my @longNames = filter(sub {length($_) > 10}, @cpNames);
    my @longNames = filter( sub { length( $_[0] ) > 10 }, @cpNames );
    map { println($_) } @longNames;

    print "\n";

    my @longNames = filter( sub { long( $_[0] ) }, @cpNames );
    map { println($_) } @longNames;

    print "\n";

    my @longNames = ifilter( sub { long( $_[0] ) }, @cpNames );
    map { println($_) } @longNames;
}

sub printConfigProperty() {
    my $propertyNameToGet = $_->{propertyName};
    my $len               = length $propertyNameToGet;
    print "$propertyNameToGet($len) $_->{gVarName}\n";
}

sub propertyName() {
    return $_->{propertyName};
}

sub setGlobalVar() {
    my $gVarNameToSet = $_->{gVarName};
    my $propertyValue = $_->{propertyName};

    my $cmdToEval = "\$$gVarNameToSet = \'$propertyValue\'";
    eval $cmdToEval;
}

sub filter() {
    my ( $cond, @coll ) = @_;
    my @out;
    map { push( @out, $_ ) if $cond->($_) } @coll;
    return @out;
}

sub ifilter() {
    my ( $cond, @coll ) = @_;
    my @out;
    foreach my $c (@coll) {
        push( @out, $c ) if $cond->($c);
    }
    return @out;
}

sub println() {
    print "$_\n";
}

sub long() {
    length( $_[0] ) > 10;
}
