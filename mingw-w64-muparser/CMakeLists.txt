project (muParser CXX)

cmake_minimum_required(VERSION 2.8)

file (GLOB headers "include/*.h")
file (GLOB sources "src/*.cpp")

add_library(muparser ${sources})
if (BUILD_SHARED_LIBS)
  set_target_properties(muparser PROPERTIES SUFFIX "-2.dll")
endif()

install (TARGETS muparser RUNTIME DESTINATION bin
                          LIBRARY DESTINATION lib${LIB_SUFFIX}
                          ARCHIVE DESTINATION lib${LIB_SUFFIX})

install (FILES ${headers} DESTINATION include)

