cmake_minimum_required(VERSION 2.8)
project(P2T)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -ffast-math")
enable_language(CXX)
set(SOURCE_FILES 
poly2tri/poly2tri/common/shapes.cc
poly2tri/poly2tri/sweep/advancing_front.cc
poly2tri/poly2tri/sweep/cdt.cc
poly2tri/poly2tri/sweep/sweep.cc
poly2tri/poly2tri/sweep/sweep_context.cc)


SET(CMAKE_INSTALL_INCDIR "${CMAKE_INSTALL_PREFIX}/include/p2t")
SET(CMAKE_INSTALL_LIBDIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")

include_directories(${CMAKE_SOURCE_DIR}/poly2tri/poly2tri)
add_library(P2T SHARED ${SOURCE_FILES}) 

INSTALL (FILES poly2tri/poly2tri/poly2tri.h DESTINATION "${CMAKE_INSTALL_INCDIR}")
INSTALL (FILES poly2tri/poly2tri/common/shapes.h DESTINATION "${CMAKE_INSTALL_INCDIR}/common")
INSTALL (FILES poly2tri/poly2tri/common/utils.h DESTINATION "${CMAKE_INSTALL_INCDIR}/common")
INSTALL (FILES poly2tri/poly2tri/sweep/sweep.h DESTINATION "${CMAKE_INSTALL_INCDIR}/sweep")
INSTALL (FILES poly2tri/poly2tri/sweep/advancing_front.h DESTINATION "${CMAKE_INSTALL_INCDIR}/sweep")
INSTALL (FILES poly2tri/poly2tri/sweep/cdt.h DESTINATION "${CMAKE_INSTALL_INCDIR}/sweep")
INSTALL (FILES poly2tri/poly2tri/sweep/sweep_context.h DESTINATION "${CMAKE_INSTALL_INCDIR}/sweep")
INSTALL (TARGETS P2T LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}")
