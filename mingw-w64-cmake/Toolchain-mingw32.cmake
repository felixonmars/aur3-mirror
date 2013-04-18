SET(CMAKE_SYSTEM_NAME Windows)

# specify the cross compiler
SET(CMAKE_C_COMPILER /usr/bin/i686-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/i686-w64-mingw32-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH /usr/i686-w64-mingw32)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Make sure Qt can be detected by CMake
SET(QT_BINARY_DIR /usr/i686-w64-mingw32/bin /usr/bin)

# set the resource compiler (RHBZ #652435)
SET(CMAKE_RC_COMPILER /usr/bin/i686-w64-mingw32-windres)

# override boost library suffix which defaults to -mgw
SET(Boost_COMPILER -gcc47)

# These are needed for compiling lapack (RHBZ #753906)
SET(CMAKE_Fortran_COMPILER /usr/bin/i686-w64-mingw32-gfortran)
SET(CMAKE_AR:FILEPATH /usr/bin/i686-w64-mingw32-ar)
SET(CMAKE_RANLIB:FILEPATH /usr/bin/i686-w64-mingw32-ranlib)

