use Test2::V0;

use Language::Hq9plus;

can_ok("Language::Hq9plus", "new");
can_ok(Language::Hq9plus->new(""), "run");

done_testing;
