// This is replaced by libx32-hdf5.
// Old file is renamed to H5public-64.h.

#if !defined __x86_64__
# include <H5public-64.h> // lib32-hdf5 did not deliver H5public-32.h yet
#endif
#if defined __x86_64__ && defined __LP64__
# include <H5public-64.h>
#endif
#if defined __x86_64__ && defined __ILP32__
# include <H5public-x32.h>
#endif

