#!/usr/bin/perl
use strict;

my $PRINTLOG = 'my $errMsg = printLog($level, $message); if ($errMsg) { throw $errMsg; }';
print _bro()->{exitMessag} . "\n";

sub _bro {
	my %response = (
		'exitCode'    => '0',
		'exitMessage' => 'No Errors',
	);
	
	print "test 1\n";
	my $level = 'DEBUG';
	my $message = '';
	eval $PRINTLOG;
	return $@ if ($@);
	
	print "test 2\n";
	my $level = 'DEBUG';
	my $message = 'debug message';
	eval $PRINTLOG;
	return $@ if ($@);
	
	print "test 3\n";
	return {exitCode => 0, exitMessage => '' };
}

sub printLog {
	my $level = shift;
	my $message = shift;
	my $xPath = $message;
	return checkAllErrors($xPath);
}

sub throw { 
	my %response = (
		'exitCode'    => '1',
		'exitMessage' => @_,
	);
	die \%response;
} 

sub checkAllErrors {
	my $message = shift;
	return $message;
}
