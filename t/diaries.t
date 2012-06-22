#! /usr/bin/perl

use Acme::The::Secret::XS::Diaries ":all";

use Test::More;

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

ok(1);
done_testing;
