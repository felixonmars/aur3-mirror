#
#   Environment setup script for Houdini. 
#
#   To use this script you should "cd" to the hfs directory where this
#   script is located and "source" it into your c-shell or from your
#   .login script.
#
#   Alternatively you may copy this script, remove the first if
#   statement and change the setting of the "here" variable to be
#   the location of your installed Houdini hfs directory.
#
#   Note that this script modifies your search path by inserting the
#   Houdini bin directory at the beginning.
#
#   To run the script in quiet mode, specify the "-q" option on the
#   command line.
#
setenv HFS	/opt/houdini

#
#  The following are some handy shortcuts:
#
setenv H	${HFS}
setenv HB	${H}/bin
setenv HDSO	${H}/dsolib
setenv HD	${H}/demo
setenv HH	${H}/houdini
setenv HHC	${HH}/config
setenv HT   ${H}/toolkit
setenv HSB  ${HH}/sbin

#
#  The following is used as the generic /tmp path.  This is also
# set on Windows to the temporary directory, so can be used for
# system independent .hip files.
#
setenv TEMP /tmp

#
# Look for java.
#
if ( ! $?JAVA_HOME ) then
    # Check in PATH first
    # Use sh for this since CSH really really sucks
    set d=`sh -c 'which java 2>&1'`
    if ( $status == 0 ) then
        setenv JAVA_HOME `echo $d | sed 's/\/bin.*//'`
    else
        foreach dir (/usr/local /usr/local/java2 /usr/local/java /opt /usr/usr/java2 /usr/java)
            if ( -d $dir ) then
                set d=`find $dir -maxdepth 3 -path "*/bin/java" -printf "%h\n" | head -1 | sed 's/\/bin//'`
                if ( "$d" != "" ) then
                    setenv JAVA_HOME $d
                    break
                endif
            endif
        end
    endif
endif

if ( $?JAVA_HOME ) then
	set path=(${HB} ${HSB} ${JAVA_HOME}/bin $path)
else
	set path=(${HB} ${HSB} $path)
endif

rehash

setenv HOUDINI_MAJOR_RELEASE 11
setenv HOUDINI_MINOR_RELEASE 0
setenv HOUDINI_BUILD_VERSION 818
setenv HOUDINI_VERSION ${HOUDINI_MAJOR_RELEASE}.${HOUDINI_MINOR_RELEASE}.${HOUDINI_BUILD_VERSION}

# Build machine related stuff
setenv HOUDINI_BUILD_KERNEL "2.6.32-19-generic"
setenv HOUDINI_BUILD_PLATFORM "Debian squeeze/sid"
setenv HOUDINI_BUILD_COMPILER "4.4.3"

# This only applies for linux systems
setenv HOUDINI_BUILD_LIBC "glibc 2.11.1"

if ( $?prompt && ( $#argv < 1 || "$1" != "-q" ) ) then
	echo "The Houdini ${HOUDINI_VERSION} environment has been initialized."
endif

#
# These environment variables are no longer supported.
#
setenv HIH	${HOME}/houdini${HOUDINI_MAJOR_RELEASE}.${HOUDINI_MINOR_RELEASE}
# setenv HIL	${HSITE}/houdini${HOUDINI_MAJOR_RELEASE}.${HOUDINI_MINOR_RELEASE}
setenv HIS	$HH
endif
