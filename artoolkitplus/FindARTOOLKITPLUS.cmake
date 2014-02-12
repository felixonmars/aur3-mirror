# Locate ARTOOLKITPLUS
#
# This module defines
# ARTOOLKITPLUS_FOUND: if false, do not try to link to registration
# ARTOOLKITPLUS_LIBRARY, ARTOOLKITPLUS_LIBRARIES, ARTOOLKITPLUS_LIBS: where to find ARTOOLKITPLUS
# ARTOOLKITPLUS_INCLUDE_DIR, ARTOOLKITPLUS_INCLUDE_DIRS, ARTOOLKITPLUS_INCLUDE_PATH: where to find ARToolKitPlus/*.h
#

set(_INCLUDEDIRS ENV CPLUS_INCLUDE_PATH)
set(_LIBDIRS ENV LD_LIBRARY_PATH)

# find the ARTOOLKITPLUS include directory
find_path(ARTOOLKITPLUS_INCLUDE_DIR ARToolKitPlus/ARToolKitPlus.h
PATHS
/usr/local/include/
/usr/include/
/sw/ARToolKitPlus/
/opt/include/
/opt/local/include/
/opt/local/ARToolKitPlus/
/opt/csw/ARToolKitPlus/
/opt/ARToolKitPlus/
~/Library/Frameworks/ARToolKitPlus/include/
/Library/Frameworks/ARToolKitPlus/include/
${ARTOOLKITPLUS_DIR}/include/
${_INCLUDEDIRS}
)

# find the registration library
find_library(ARTOOLKITPLUS_LIBRARY 
NAMES ARToolKitPlus
PATH_SUFFIXES lib64 lib
PATHS ~/Library/Frameworks
/Library/Frameworks
/usr/local
/usr
/sw
/opt/local
/opt/csw
/opt
${ARTOOLKITPLUS_DIR}/lib
${_LIBDIRS}
)
SET ( ARTOOLKITPLUS_LIBS ${ARTOOLKITPLUS_LIBRARY})
SET ( ARTOOLKITPLUS_LIBRARIES ${ARTOOLKITPLUS_LIBRARY})
SET ( ARTOOLKITPLUS_INCLUDE_DIRS ${ARTOOLKITPLUS_INCLUDE_DIR})
SET ( ARTOOLKITPLUS_INCLUDE_PATH ${ARTOOLKITPLUS_INCLUDE_DIR})

# handle the QUIETLY and REQUIRED arguments and set ARTOOLKITPLUS_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ARTOOLKITPLUS DEFAULT_MSG ARTOOLKITPLUS_INCLUDE_DIR ARTOOLKITPLUS_LIBRARY)
