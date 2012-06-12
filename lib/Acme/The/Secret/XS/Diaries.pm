use strict;
use warnings;
package Acme::The::Secret::XS::Diaries;
# ABSTRACT: Experiments of an XS n00b

use Sub::Exporter
 -setup => {
            exports => [
                        qw( hello
                            is_even
                         ),
                       ],
            groups => {
                       all => [ qw(hello
                                   is_even
                                 ) ],
                      },
           };

require XSLoader;
XSLoader::load();

1;
