#! /usr/bin/perl

use Acme::The::Secret::XS::Diaries ":all";

use Test::More;
use Test::Deep qw(cmp_deeply);
use Scalar::Util qw(looks_like_number);
use Benchmark qw(timeit);

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

sub fib_pl {
        my ($n) = @_;
        return 1 if $n < 2;
        return fib_pl($n-2) + fib_pl($n-1);
}

my $arrayref = [keys %$hashref];
hello_to_persons_arrayref($arrayref);
hello_to_persons_hashref($hashref);
hello_to_persons_hashref_by_keys($hashref, [keys %$hashref]);
cmp_deeply([get_5_ints()], [11,33,55,77,99], "got 5 integers");
cmp_deeply([get_2_strings()], ["AFFE", "ZOMTEC"], "got 2 strings");
cmp_deeply([get_5_ints_faster()], [11,33,55,77,99], "got 5 integers faster");
cmp_deeply([get_2_strings_faster()], ["AFFE", "ZOMTEC"], "got 2 strings faster");
my @list = (1, 2, 3, "four", "five", 6.0, 6.1, 7, "8", 90, 0102 );
my @evens_xs = grep_even_integers @list ;
my @evens_pl = grep { looks_like_number $_ and $_ % 2 == 0 } @list;
cmp_deeply(\@evens_xs, [2, 6.0, 6.1, 8, 90, 0102], "grep even integers - XS"); # 6.1 is in as test uses int downgrade
cmp_deeply(\@evens_pl, \@evens_xs, "grep even integers - Perl");
my $n = 32;
my @fibs = ( 1, 1, 2, 3, 5, 8, 13, 21, 34 );
is(fib_pl($_),       $fibs[$_], "fib_pl $_")       foreach 0..$#fibs;
diag "time fib_pl($n):       ".timeit(1, "fib_pl($n)")->[1];

ok(1, "survived");
done_testing;
