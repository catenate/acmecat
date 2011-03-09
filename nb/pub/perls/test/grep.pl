#!/usr/bin/perl
use strict;

my $string = '<?xml version="1.0" encoding="UTF-8"?>

	<responses xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="commander.xsd" version="2.1" dispatchId="230428">
	  <response requestId="9"/>
	</responses> ';

#print $string . "\n";
my @lines = split "\n", $string;
print "grep block 9:\n";
print grep {/9/} @lines;
print "\n";

print "\ngrep expr 9:\n";
print grep( /9/, @lines );
print "\n";

print "\nprint expr 9 with \\n:\n";
print grep( /9/, @lines ) . "\n";

print "\n9s:\n";
my $count9 = grep( /9/, @lines );
if ($count9) {
    print "found a 9\n";
    print grep( /9/, @lines );
    print "\n";
}
else {
    print "found no 9s\n";
}
print "has $count9 9s\n";

print "\nerrors:\n";
my $errors = grep( /[Ee][Rr][Rr][Oo][Rr]/, @lines );
if ($errors) {
    print "found an error:\n";
    print grep( /[Ee][Rr][Rr][Oo][Rr]/, @lines );
    print "\n";
}
else {
    print "found no errors\n";
}
print "has $errors errors\n";

print "\nprint lines:\n";
print @lines;
print "\n";

print "\nmap lines:\n";
map { print $_} @lines;
print "\n";

print "\nmap list of grep 9:\n";
my @lines9 = grep( /9/, @lines );
map { print $_} @lines9;
print "\n";
