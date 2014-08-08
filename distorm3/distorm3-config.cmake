# - Find distorm3
# This module tries to find the distorm library and headers.
# Once done this will define
#
#   DISTORM3_FOUND - system has distorm headers and libraries
#   DISTORM3_INCLUDE_DIRS - the include directories needed for distorm
#   DISTORM3_LIBRARIES - the libraries needed to use distorm
#


find_path(
    DISTORM3_INCLUDE_DIRS 
    NAMES distorm.h
    PATH_SUFFIXES include
)

find_library(
    DISTORM3_LIBRARIES
    NAMES distorm3
    PATHS /usr/lib/python2.7/site-packages/distorm3
    PATH_SUFFIXES lib64 lib32 lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    distorm
    DEFAULT_MSG
    DISTORM3_INCLUDE_DIRS
    DISTORM3_LIBRARIES
)
