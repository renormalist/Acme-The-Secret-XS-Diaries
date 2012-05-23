#! /usr/bin/perl

use Acme::The::Secret::XS::Diaries;

use Test::More;

Acme::The::Secret::XS::Diaries::hello();

ok(1);
done_testing;
