cmake_minimum_required (VERSION 2.6)
project (OALWrapper)

set(OALWrapper_VERSION_MAJOR 1)
set(OALWrapper_VERSION_MINOR 0)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/include 
)
file(GLOB_RECURSE all_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/sources/*.cpp
)
file(GLOB all_headers
    ${CMAKE_CURRENT_SOURCE_DIR}/include/OALWrapper/*.h
)

add_library(OALWrapper SHARED ${all_sources})
set_target_properties (OALWrapper PROPERTIES
                       VERSION ${OALWrapper_VERSION_MAJOR}.${OALWrapper_VERSION_MINOR}
                       SOVERSION ${OALWrapper_VERSION_MAJOR}
)

target_link_libraries(OALWrapper ogg vorbis vorbisfile alut openal SDL)

install(FILES ${all_headers}
        DESTINATION include/OALWrapper
)

install(TARGETS OALWrapper
        LIBRARY DESTINATION lib
)
