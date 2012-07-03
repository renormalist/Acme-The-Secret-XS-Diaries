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

void
hello_to_persons_hashref(persons)
        HV *persons;
        PREINIT:
                SV*    value;
                char*  key;
                I32    keylen;
                STRLEN str_len;
                char * el_str;
                I32    el_int;
        PPCODE:
                hv_iterinit(persons);
                printf("Hello, unknown amount of persons:\n");
                while (value = hv_iternextsv(persons, &key, &keylen)) {
                      if (SvPOK(value)) {
                         el_str = SvPV(value, str_len);
                         printf("  Hello, %s %s!\n", el_str, key);
                      } else if (SvIOK(value)) {
                         el_int = SvIV(value);
                         printf("  Hello, %d %s!\n", el_int, key);
                      } else {
                         printf("  (ignored) %s\n", key);
                      }
                }

void
hello_to_persons_hashref_by_keys(persons, keys)
        HV *persons;
        AV *keys;
        PREINIT:
                I32    i;
                I32    len;
                SV**   key_el;
                SV**   value;
                char*  key;
                STRLEN str_len;
                char * el_str;
                I32    el_int;
        PPCODE:
                len = av_len(keys);
                printf("Hello, %d persons:\n", len+1);
                for (i = 0; i <= len; i++) {
                    key_el = av_fetch(keys, i, 0);
                    if (key_el != NULL && SvPOK(*key_el)) {
                          key = SvPV(*key_el, str_len);
                          value = hv_fetch(persons, key, strlen(key), 0);
                          if (SvPOK(*value)) {
                             el_str = SvPV(*value, str_len);
                             printf("  Hello, %s %s!\n", el_str, key);
                          } else if (SvIOK(*value)) {
                             el_int = SvIV(*value);
                             printf("  Hello, %d %s!\n", el_int, key);
                          } else {
                             printf("  (ignored) %s\n", key);
                          }
                    }
                }

void
get_5_ints()
        PPCODE:
                mXPUSHi(11);
                mXPUSHi(33);
                mXPUSHi(55);
                mXPUSHi(77);
                mXPUSHi(99);

void
get_2_strings()
        INIT:
                char * txt;
        PPCODE:
                txt = "AFFE";
                mXPUSHp(txt, strlen(txt));
                txt = "ZOMTEC";
                mXPUSHp(txt, strlen(txt));

void
get_5_ints_faster()
        PPCODE:
                EXTEND(SP,5);
                mPUSHi(11);
                mPUSHi(33);
                mPUSHi(55);
                mPUSHi(77);
                mPUSHi(99);

void
get_2_strings_faster()
        INIT:
                char * txt;
        PPCODE:
                EXTEND(SP,2);
                txt = "AFFE";
                mPUSHp(txt, strlen(txt));
                txt = "ZOMTEC";
                mPUSHp(txt, strlen(txt));

void
grep_even_integers(...)
        INIT:
                int i;
                SV* el;
                int value;
        PPCODE:
                for (i = 0; i < items; i++) {
                    el = ST(i);
                    if (SvIOK(el) || looks_like_number(el)) {
                       value = SvIV(el);
                       if (value % 2 == 0)
                          mXPUSHs(SvREFCNT_inc(el));
                    }
                }
