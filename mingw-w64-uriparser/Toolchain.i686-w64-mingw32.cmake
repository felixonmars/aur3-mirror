SET(CMAKE_SYSTEM_NAME Windows)
SET(TOOLCHAIN_PREFIX i686-w64-mingw32)

# cross compilers to use for C and C++
SET(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
SET(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
SET(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)

# target environment on the build host system
# SET 1st to dir with the cross compiler's C/C++ headers/libs
# SET 2nd to dir containing personal cross development headers/libs
SET(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})

# modify default behavior of FIND_XXX() commands to
# search for headers/libs in the target environment and
# search for programs in the build host environment
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
