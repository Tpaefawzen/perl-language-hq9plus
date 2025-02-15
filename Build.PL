use Module::Build;

my $b = Module::Build->new(
	module_name	=>	'Language::Hq9plus',
	license		=>	'open_source',
	# kinda no requirements
	dist_author	=>	'Tpaefawzen',
	test_requires	=>	{
		'Test2::V0'	=>	0.00,
	},
	version => v0.1.0,
);
$b->create_build_script;
