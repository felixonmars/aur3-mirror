SET(CMAKE_SYSTEM_NAME Windows)

# specify the cross compiler
SET(CMAKE_C_COMPILER @TRIPLE@-gcc)
SET(CMAKE_CXX_COMPILER @TRIPLE@-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH /usr/@TRIPLE@)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Make sure Qt can be detected by CMake
SET(QT_BINARY_DIR /usr/@TRIPLE@/bin /usr/bin)
SET(QT_INCLUDE_DIRS_NO_SYSTEM ON)

# set the resource compiler (RHBZ #652435)
SET(CMAKE_RC_COMPILER @TRIPLE@-windres)

# override boost thread component suffix as mingw-w64-boost is compiled with threadapi=win32
SET(Boost_THREADAPI win32)

# These are needed for compiling lapack (RHBZ #753906)
SET(CMAKE_Fortran_COMPILER @TRIPLE@-gfortran)
SET(CMAKE_AR:FILEPATH @TRIPLE@-ar)
SET(CMAKE_RANLIB:FILEPATH @TRIPLE@-ranlib)

