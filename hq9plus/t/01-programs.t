use Test2::V0;

use Language::Hq9plus;

my $pg = "HHHHQQQ9++++";
my $machine = Language::Hq9plus->new($pg);

my $stdout;
{
    open local *STDOUT, ">", \$stdout;
    $machine->run();
}

my $matches = 0;
$matches++ while $stdout =~ /Hello, [Ww]orld!/g;
is($matches, 4);

$matches = 0;
$matches++ while $stdout =~ /\Q$pg\E/g;
is($matches, 3);

ok($stdout =~ /99 bottles of beer on the wall,/);
ok($stdout =~ /Take one down and pass it around,/);
ok($stdout !~ /^1 bottles of beer/m);
ok($stdout =~ /^1 bottle of beer/m);
ok($stdout =~ /No more bottles of beer/ || $stdout =~ /^0 bottles of beer/m);

is($machine->{accum}, 4);

done_testing;
