require require_global;
require require_test;

require require_global;
require require_test;

$::gexport = "export";

my $myrequire = "myrequire";

main();

sub main {
	my $call_myglobal = get_myglobal();
	test($myrequire, $myglobal, $call_myglobal);
}
