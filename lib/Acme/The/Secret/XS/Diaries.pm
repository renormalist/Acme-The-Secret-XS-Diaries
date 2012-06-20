use strict;
use warnings;
package Acme::The::Secret::XS::Diaries;
# ABSTRACT: Experiments of an XS n00b

use Sub::Exporter
 -setup => {
            exports => [
                        qw( hello
                            hello_to
                            hello_to_persons_arrayref
                            is_even
                         ),
                       ],
            groups => {
                       all => [ qw(hello
                                   hello_to
                                   hello_to_persons_arrayref
                                   is_even
                                 ) ],
                      },
           };

require XSLoader;
XSLoader::load();

1;
