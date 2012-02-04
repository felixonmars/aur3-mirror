#!/bin/sh
# scripts/antlr-config.  Generated from antlr-config.in by configure.

prefix=/usr
exec_prefix=${prefix}
datadir=${prefix}/share
libdir=${exec_prefix}/lib
includedir=${prefix}/include

usage()
{
	cat <<EOF
Usage: antlr-config [OPTIONS] [LIBRARIES]
Options:
	[--prefix[=DIR]]
	[--exec-prefix[=DIR]]
	[--version]
	[--libs]
	[--cflags]
	[--cxxflags]
Libraries:
	libantlr.a
EOF
	exit $1
}

if test $# -eq 0; then
	usage 1 1>&2
fi

includes=""
libs=""

while test $# -gt 0; do
	case "$1" in
		-*=*) optarg=`echo "$1" | sed 's/[-_a-zA-Z0-9]*=//'` ;;
		*) optarg= ;;
	esac

	case $1 in
	--prefix)
		echo_prefix=yes
      ;;
	--exec-prefix)
		echo_exec_prefix=yes
      ;;
	--version)
		echo 2.7.7
      exit 0
      ;;
	--cflags|-cxxflags)
      includes="-I${includedir}"
      echo_cflags="yes"
      ;;
	--libs)
      case gcc in
        cl|bcc32)
          libs="${libdir}/antlr.lib"
          ;;
          *)
          libs="${libdir}/libantlr.a"
          ;;
      esac
      echo_libs=yes
      ;;
	*)
      usage 1 1>&2
      ;;
		esac
	shift
done

if test "$echo_prefix" = "yes"; then
	echo $prefix
fi
if test "$echo_exec_prefix" = "yes"; then
	echo $exec_prefix
fi
if test "$echo_cflags" = "yes"; then
	echo $includes
fi
if test "$echo_libs" = "yes"; then
	echo "${libs}"
fi

exit 0
