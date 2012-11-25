#include <bits/wordsize.h>

#if __WORDSIZE == 32
#if defined __x86_64__ && defined __ILP32__
#include "curlbuild-x32.h"
#else
#include "curlbuild-32.h"
#endif
#elif __WORDSIZE == 64
#include "curlbuild-64.h"
#else
#error "Unknown word size"
#endif
