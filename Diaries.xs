#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

MODULE = Acme::The::Secret::XS::Diaries       PACKAGE = Acme::The::Secret::XS::Diaries

void
hello()
        CODE:
                printf("Hello, world!\n");

int
is_even(input)
        int input
        CODE:
                RETVAL = (input % 2 == 0);
        OUTPUT:
                RETVAL
