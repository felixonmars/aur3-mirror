cmake_minimum_required(VERSION 2.6)

if( NOT DEFINED BEAR_ROOT_DIRECTORY )
  set( BEAR_ROOT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bear" )
endif()

set( CMAKE_MODULE_PATH "${BEAR_ROOT_DIRECTORY}/cmake-helper" )

include( uninstall )

subdirs( bear asgp )
