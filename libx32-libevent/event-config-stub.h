// This is replaced by libx32-libevent.
// Old file is renamed to event-config-64.h.

#if !defined __x86_64__
# include <event2/event-config-64.h> // lib32-libevent did not deliver event-config-32.h yet
#endif
#if defined __x86_64__ && defined __LP64__
# include <event2/event-config-64.h>
#endif
#if defined __x86_64__ && defined __ILP32__
# include <event2/event-config-x32.h>
#endif

