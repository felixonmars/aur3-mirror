# Minimal version
cmake_minimum_required(VERSION 2.6)

include_directories(
	${CMAKE_SOURCE_DIR}/src
	${CMAKE_SOURCE_DIR}/include
)

SET( _SOURCES
	${CMAKE_SOURCE_DIR}/src/UriCommon.c
	${CMAKE_SOURCE_DIR}/src/UriCompare.c
	${CMAKE_SOURCE_DIR}/src/UriEscape.c
	${CMAKE_SOURCE_DIR}/src/UriFile.c
	${CMAKE_SOURCE_DIR}/src/UriIp4.c
	${CMAKE_SOURCE_DIR}/src/UriIp4Base.c
	${CMAKE_SOURCE_DIR}/src/UriNormalize.c
	${CMAKE_SOURCE_DIR}/src/UriNormalizeBase.c
	${CMAKE_SOURCE_DIR}/src/UriParse.c
	${CMAKE_SOURCE_DIR}/src/UriParseBase.c
	${CMAKE_SOURCE_DIR}/src/UriQuery.c
	${CMAKE_SOURCE_DIR}/src/UriRecompose.c
	${CMAKE_SOURCE_DIR}/src/UriResolve.c
	${CMAKE_SOURCE_DIR}/src/UriShorten.c
)

ADD_LIBRARY( uriparser SHARED ${_SOURCES})

INSTALL(FILES ${CMAKE_BINARY_DIR}/liburiparser.dll DESTINATION bin)
INSTALL(FILES ${CMAKE_BINARY_DIR}/liburiparser.dll.a DESTINATION lib)
INSTALL(DIRECTORY ${CMAKE_SOURCE_DIR}/include/uriparser DESTINATION include)
