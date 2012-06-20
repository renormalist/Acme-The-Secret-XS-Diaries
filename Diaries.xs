#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

MODULE = Acme::The::Secret::XS::Diaries       PACKAGE = Acme::The::Secret::XS::Diaries

void
hello()
        CODE:
                printf("Hello, world!\n");

void
hello_to(someone)
        const char * someone
        CODE:
                printf("Hello, %s!\n", someone);


int
is_even(input)
        int input
        CODE:
                RETVAL = (input % 2 == 0);
        OUTPUT:
                RETVAL

void
hello_to_persons_arrayref(persons)
        AV *persons;
        PREINIT:
                I32    i;
                I32    len;
                SV**   element;
                STRLEN str_len;
                char * el_str;
                I32    el_int;
        PPCODE:
                len = av_len(persons);
                printf("Hello, %d persons:\n", len+1);
                for (i = 0; i <= len; i++) {
                    element = av_fetch(persons, i, 0);
                    if (element != NULL) {
                       if (SvPOK(*element)) {
                          el_str = SvPV(*element, str_len);
                          printf("  %d: Hello, %s!\n", i, el_str);
                       } else if (SvIOK(*element)) {
                          el_int = SvIV(*element);
                          printf("  %d: Hello, %d!\n", i, el_int);
                       } else {
                         printf("  %d: (ignored)\n", i);
                       }
                    }
                }
