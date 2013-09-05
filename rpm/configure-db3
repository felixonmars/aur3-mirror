#!/bin/sh
#set -x 
base_name=`basename $0`
base_path=`echo $0 | sed s,$base_name,,`

db_dist="${base_path}../db/dist"

rm -f config.cache

# We iterate over the argument list.  Processing the arguments using 
# echo "$*" can fail with the sed chopping out parts of unrelated 
# arguments
set -- "$@" eoa_marker
while [ "$1" != "eoa_marker" ]; do
   ARG=`echo "$1" | \
       sed -e 's%CC=g++%CC=gcc%' \
           -e 's%CFLAGS=.*%%' \
           -e 's%--param=.*%%g' \
           -e 's%--cache-file=.*$%%' \
           -e 's%--with-db-rpc=\(.*\)%--enable-rpc=\1%' \
           -e 's%--with-db-rpc%--enable-rpc%' \
           -e 's%--without-db-rpc%--disable-rpc%' \
           -e 's%--with-db-largefile=\(.*\)%--enable-largefile=\1%' \
           -e 's%--with-db-largefile%--enable-largefile%' \
           -e 's%--without-db-largefile%--disable-largefile%' \
           -e 's%--with-db-mutex=\(.*\)%--with-mutex=\1%' \
           -e 's%--with-tcl[^ ]*%%' \
           -e 's%--with-db-mutex%%' \
           -e 's%--without-db-mutex%%' \
   `
   shift
   set -- "$@" "$ARG"
done
shift


#   NOTICE:
#   1. "--enable-shared" is there for enforcing GNU libtool usage only
#      as Berkeley-DB "configure" else would not use GNU libtool at all.
#   2. "--enable-static" is there for enforcing the building of a static
#      version of the libdb objects RPM actually is interested in.

# XXX Berkeley DB fails to find a locking scheme if CC=g++
CC="$CC" CFLAGS="$CFLAGS" $db_dist/configure "$@" \
	--enable-shared --enable-static \
	--with-crytography=yes --enable-o_direct \
	--enable-sql --enable-amalgamation --enable-sql_codegen \
	--srcdir=$db_dist || exit 1

mv Makefile Makefile.orig
cat Makefile.orig | sed -e '/^install[:-]/c\
distdir install check:\
' -e 's/^\(SOFLAGS=\).*$/\1/' > Makefile

mv db.h db.h.orig
cat db.h.orig | sed \
	-e '/^typedef	u_int32_t	db_pgno_t;/i\
/*@-incondefs -fielduse -enummemuse -typeuse @*/' \
	-e '/^struct __key_range;/a\
/*@=incondefs@*/' \
	-e '/^#define	db_create/i\
/*@-declundef -noparams -fcnuse@*/' \
	-e '/^int txn_commit __P((/a\
/*@=declundef =noparams =fcnuse =fielduse =enummemuse =typeuse @*/' > db.h

