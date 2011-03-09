sub test {
	my $arg_myrequire = shift;
	my $arg_myglobal = shift;
	my $arg_get_myglobal = shift;
	
	print "test:$myrequire:$arg_myrequire\n";
	print "test:$myglobal:$arg_myglobal:$arg_get_myglobal\n";
	print "test:$gexport:$gpmexport\n";
	print "test:$::gexport:$::gpmexport\n";
}

1;
