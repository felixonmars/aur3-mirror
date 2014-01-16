project (muParser CXX)

cmake_minimum_required(VERSION 2.8)


option ( USE_OPENMP "Use OpenMP for multithreading" OFF )


if ( USE_OPENMP )
  find_package ( OpenMP )
endif ()
if ( OPENMP_FOUND )
  set ( CMAKE_CXX_FLAGS "${OpenMP_CXX_FLAGS} ${CMAKE_CXX_FLAGS}" )
  set (CMAKE_SHARED_LINKER_FLAGS "${OpenMP_CXX_FLAGS} ${CMAKE_SHARED_LINKER_FLAGS}")
endif ()



file (GLOB headers "include/*.h")
file (GLOB sources "src/*.cpp")

include_directories(include)

add_library(muparser ${sources})
if (BUILD_SHARED_LIBS)
  set_target_properties(muparser PROPERTIES SUFFIX "-2.dll")
endif()

install (TARGETS muparser RUNTIME DESTINATION bin
                          LIBRARY DESTINATION lib${LIB_SUFFIX}
                          ARCHIVE DESTINATION lib${LIB_SUFFIX})

install (FILES ${headers} DESTINATION include)


