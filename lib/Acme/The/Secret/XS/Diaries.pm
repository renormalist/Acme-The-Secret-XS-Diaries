use strict;
use warnings;
package Acme::The::Secret::XS::Diaries;
# ABSTRACT: Experiments of an XS n00b

use Sub::Exporter
 -setup => {
            exports => [
                        qw(hello),
                       ],
            groups => {
                       all => [ qw(hello) ],
                      },
           };

require XSLoader;
XSLoader::load();

1;
