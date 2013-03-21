# Minimum CMake version
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
#include base etk functionality

# Fortran project --> chooses the right compiler
PROJECT(hsl Fortran)

# We will compile every .f and .f90 file in the directory
FILE(GLOB_RECURSE SRCS "${HSL_FILE_DIR}/*.f" "${HSL_FILE_DIR}/*.f90")

# Create libhsl library
ADD_LIBRARY(hsl SHARED ${SRCS})

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /NODEFAULTLIB}")
SET_TARGET_PROPERTIES(hsl PROPERTIES DEBUG_POSTFIX -d)

SET(INSTALL_LIB_PATH  ${CMAKE_INSTALL_PREFIX}/lib)
INSTALL(TARGETS hsl DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
