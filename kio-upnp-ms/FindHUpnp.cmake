# - Find HUpnp
# HUpnp is a Universal Plug and Play (UPnP) library
# used by the UPnP collection.
# Defines:
# HUPNP_INCLUDE_DIR
# HUPNP_LIBS
# HUPNP_FOUND

find_path(HUPNP_INCLUDE_DIR HUpnpCore HINTS ${KDE4_INCLUDE_DIR})

find_library(HUPNP_LIBS HUpnp PATHS ${KDE4_LIB_DIR})

if(HUPNP_INCLUDE_DIR)
  message(STATUS "Include dir match (${KDE4_INCLUDE_DIR})")
endif(HUPNP_INCLUDE_DIR)

if(HUPNP_LIBS)
  message(STATUS "Library dir match")
 else(HUPNP_LIBS)
  message(STATUS "Library not found in ${KDE4_LIB_DIR}")
endif(HUPNP_LIBS)

if(HUPNP_INCLUDE_DIR AND HUPNP_LIBS)
  set(HUPNP_FOUND TRUE)
  message(STATUS "Found HUpnp")
else(HUPNP_INCLUDE_DIR and HUPNP_LIBS)
  set(HUPNP_FOUND FALSE)
  if(HUPNP_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find required package HUpnp: <http://herqq.org>")
  endif(HUPNP_FIND_REQUIRED)
endif(HUPNP_INCLUDE_DIR AND HUPNP_LIBS)

