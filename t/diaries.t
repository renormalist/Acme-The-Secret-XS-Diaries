#! /usr/bin/perl

use Acme::The::Secret::XS::Diaries ":all";

use Test::More;

hello();
is(is_even(0), 1, "0 -> even");
is(is_even(1), 0, "1 -> uneven");
is(is_even(2), 1, "2 -> even");
hello_to("birne");

ok(1);
done_testing;
