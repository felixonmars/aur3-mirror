#include <bits/wordsize.h>

#if __WORDSIZE == 32
#if defined __x86_64__
#include "config_types-x32.h"
#else
#include "config_types-32.h"
#endif
#elif __WORDSIZE == 64
#include "config_types-64.h"
#else
#error "Unknown word size"
#endif

