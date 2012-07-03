#! /usr/bin/perl

use Acme::The::Secret::XS::Diaries ":all";

use Test::More;
use Test::Deep qw(cmp_deeply);

hello();
is(is_even(0), 1, "0 -> even");
is(is_even(1), 0, "1 -> uneven");
is(is_even(2), 1, "2 -> even");
hello_to("birne");
my $hashref = {
               Mom       => "Dear",
               Holle     => "Frau",
               1234567   => "lucky number",
               3456      => 12,
               President => "Mr.",
              };
my $arrayref = [keys %$hashref];
hello_to_persons_arrayref($arrayref);
hello_to_persons_hashref($hashref);
hello_to_persons_hashref_by_keys($hashref, [keys %$hashref]);
cmp_deeply([get_5_ints()], [11,33,55,77,99], "got 5 integers");
cmp_deeply([get_2_strings()], ["AFFE", "ZOMTEC"], "got 2 strings");

ok(1, "survived");
done_testing;
