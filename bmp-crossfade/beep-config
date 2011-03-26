#!/bin/sh

# beep-config
#
# Tool for retrieving the library/include paths BMP was compiled with.
#
# Useful for folks compiling their own BMP plugins outside the main
# source tree.
#
# Original xmms-config written 15 December 1999 by Ben Gertzfield <che@debian.org>
# Based *HEAVILY* on gtk-config from the GTK+ library package.
#
# Modified to beep-config 29 August 2004 by Tony Vroon <chainsaw@gentoo.org>
#
# This work is released under the GNU GPL, version 2 or later.


version=`/usr/bin/pkg-config --variable=version bmp`
prefix=`/usr/bin/pkg-config --variable=prefix bmp`
exec_prefix=`/usr/bin/pkg-config --variable=prefix bmp`
data_dir=`/usr/bin/pkg-config --variable=data_dir bmp`
lib_dir=`/usr/bin/pkg-config --variable=lib_dir bmp`
plugin_dir=`/usr/bin/pkg-config --variable=output_plugin_dir bmp`
visualization_plugin_dir=`/usr/bin/pkg-config --variable=visualization_plugin_dir bmp`
input_plugin_dir=`/usr/bin/pkg-config --variable=input_plugin_dir bmp`
output_plugin_dir=`/usr/bin/pkg-config --variable=output_plugin_dir bmp`
effect_plugin_dir=`/usr/bin/pkg-config --variable=effect_plugin_dir bmp`
general_plugin_dir=`/usr/bin/pkg-config --variable=general_plugin_dir bmp`
cflags=`/usr/bin/pkg-config --cflags bmp`
libs=`/usr/bin/pkg-config --libs bmp`

usage()
{
    cat <<EOF
Usage: beep-config [OPTIONS]
Options:
    [--prefix]
    [--exec-prefix]
    [--version]
    [--libs]
    [--cflags]
    [--data-dir]
    [--plugin-dir]
    [--visualization-plugin-dir]
    [--input-plugin-dir]
    [--output-plugin-dir]
    [--effect-plugin-dir]
    [--general-plugin-dir]

EOF
    exit $1
}

if test $# -eq 0; then
    usage 1 1>&2
fi


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
	    if [ -n "${FAKE_XMMS_VERSION}" ]; then
		echo ${FAKE_XMMS_VERSION}
	    else
	        echo $version
	    fi
	    ;;

	--cflags)
	    echo_cflags=yes
	    ;;

	--libs)
	    echo_libs=yes
	    ;;

	--data-dir)
	    echo_data_dir=yes
	    ;;

	--plugin-dir)
	    echo_plugin_dir=yes
	    ;;

	--visualization-plugin-dir)
	    echo_visualization_plugin_dir=yes
	    ;;

	--input-plugin-dir)
	    echo_input_plugin_dir=yes
	    ;;

	--output-plugin-dir)
	    echo_output_plugin_dir=yes
	    ;;

	--general-plugin-dir)
	    echo_general_plugin_dir=yes
	    ;;

	--effect-plugin-dir)
	    echo_effect_plugin_dir=yes
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
    echo $cflags
fi

if test "$echo_libs" = "yes"; then
    echo $libs
fi

if test "$echo_data_dir" = "yes"; then
    echo $data_dir
fi

if test "$echo_plugin_dir" = "yes"; then
    echo $plugin_dir
fi

if test "$echo_visualization_plugin_dir" = "yes"; then
    echo $visualization_plugin_dir
fi

if test "$echo_input_plugin_dir" = "yes"; then
    echo $input_plugin_dir
fi

if test "$echo_output_plugin_dir" = "yes"; then
    echo $output_plugin_dir
fi

if test "$echo_general_plugin_dir" = "yes"; then
    echo $general_plugin_dir
fi

if test "$echo_effect_plugin_dir" = "yes"; then
    echo $effect_plugin_dir
fi
