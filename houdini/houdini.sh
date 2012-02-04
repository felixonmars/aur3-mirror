#
#   Environment setup script for Houdini.
#
#   To use this script you should "cd" to the hfs directory where this
#   script is located and "source" it into your bash shell or from your
#   .profile script.
#
#   Alternatively you may copy this script, remove the first if
#   statement and change the setting of the "HFS" variable to be
#   the location of your installed Houdini hfs directory.
#
#   Note that this script modifies your search path by inserting the
#   Houdini bin directory at the beginning.
#
#   To run the script in quiet mode, specify the "-q" option on the
#   command line.
#
export HFS=/opt/houdini

#
#  The following are some handy shortcuts:
#
export H=${HFS}
export HB=${H}/bin
export HDSO=${H}/dsolib
export HD=${H}/demo
export HH=${H}/houdini
export HHC=${HH}/config
export HT=${H}/toolkit
export HSB=${HH}/sbin

#
#  The following is used as the generic /tmp path.  This is also
# set on Windows to the temporary directory, so can be used for
# system independent .hip files.
#
export TEMP=/tmp

#
# Look for java.
#
if [ "$JAVA_HOME" = "" ]; then
    # Check in PATH first
    d=$(which java 2>&1)
    if [ "$?" = "0" ]; then
        export JAVA_HOME=`echo ${d} | sed 's/\/bin.*//g'`
    else
        for dir in /usr/local /usr/local/java2 /usr/local/java /opt /usr /usr/java2 /usr/java; do
            if [ -d $dir ]; then
                d=$(find $dir -maxdepth 3 -path "*/bin/java" -printf "%h\n"| head -1 | sed 's/\/bin//')
                if [ $d ]; then
                    export JAVA_HOME=$d
                    break
                fi
            fi
        done
    fi
fi

if [ "$JAVA_HOME" = "" ]; then
	PATH="${HB}:${HSB}:$PATH"
else
	PATH="${HB}:${HSB}:${JAVA_HOME}/bin:$PATH"
fi
export PATH

export HOUDINI_MAJOR_RELEASE=11
export HOUDINI_MINOR_RELEASE=0
export HOUDINI_BUILD_VERSION=818
export HOUDINI_VERSION=${HOUDINI_MAJOR_RELEASE}.${HOUDINI_MINOR_RELEASE}.${HOUDINI_BUILD_VERSION}

# Build machine related stuff
export HOUDINI_BUILD_KERNEL="2.6.32-19-generic"
export HOUDINI_BUILD_PLATFORM="Debian squeeze/sid"
export HOUDINI_BUILD_COMPILER="4.4.3"

# This only applies for linux systems
export HOUDINI_BUILD_LIBC="glibc 2.11.1"

if [ $?prompt ]; then
	if [ "$1" != "-q" ]; then
	    echo "The Houdini ${HOUDINI_VERSION} environment has been initialized."
	fi
fi

#
# These environment variables are no longer supported.
#
export HIH=${HOME}/houdini${HOUDINI_MAJOR_RELEASE}.${HOUDINI_MINOR_RELEASE}
# HIL=${HSITE}/houdini${HOUDINI_MAJOR_RELEASE}.$HOUDINI_MINOR_RELEASE}
export HIS=$HH
fi
