project (LibDelta)

# Quit if the main environment var is not set
set (DELPHOSPREFIX "/usr")

cmake_minimum_required (VERSION 2.6.0)

# Looking for required libraries
find_package (Qt4 REQUIRED)
find_package (X11 REQUIRED)

# Define (and fetch) version
set (LIBDELTA_VERSION 0.2.5)

# Try to get the Bazaar revision
execute_process (COMMAND bzr revno ${CMAKE_CURRENT_SOURCE_DIR}
                 OUTPUT_VARIABLE LIBDELTA_BZR_VERSION
                 OUTPUT_STRIP_TRAILING_WHITESPACE
                 ERROR_QUIET)
if (LIBDELTA_BZR_VERSION)
    set (LIBDELTA_VERSION "${LIBDELTA_VERSION} (bzr rev ${LIBDELTA_BZR_VERSION})")
endif ()

message ("LibDelta (${LIBDELTA_VERSION})")

# Directories structure
set (LIB_DIR ${DELPHOSPREFIX}/lib/)
set (INCLUDE_DIR ${DELPHOSPREFIX}/include/Delta/)
set (PIXMAPS_DIR ${DELPHOSPREFIX}/share/DelphOS/pixmaps/)
set (LOCALE_DIR ${DELPHOSPREFIX}/share/DelphOS/locale/)

message ("DelphOS prefix is set to ${DELPHOSPREFIX}")
message ("The library is going to be installed at ${LIB_DIR}")
message ("The headers are going to be installed at ${INCLUDE_DIR}")

# Generate the version string
execute_process (COMMAND "${CMAKE_SOURCE_DIR}/generate_version.sh" ${CMAKE_BINARY_DIR} ${LIBDELTA_VERSION})

add_subdirectory (src)
add_subdirectory (pixmaps)
add_subdirectory (includes)
