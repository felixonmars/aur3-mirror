// This is replaced by libx32-geos.
// Old file is renamed to platform-64.h.

#if !defined __x86_64__
# include "platform-64.h" // lib32-geos did not deliver platform-32.h yet
#endif
#if defined __x86_64__ && defined __LP64__
# include "platform-64.h"
#endif
#if defined __x86_64__ && defined __ILP32__
# include "platform-x32.h"
#endif

