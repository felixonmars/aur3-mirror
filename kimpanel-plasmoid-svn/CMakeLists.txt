
# this works also for the weatherutils include dir, but should be done properly, Alex
include_directories(${PLASMACLOCK_INCLUDE_DIR})

if (Q_WS_X11)
   if (X11_Xrender_FOUND)
      set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/kimpanel/cmake)
      macro_optional_find_package(SCIM)
      macro_log_feature(SCIM_FOUND "SCIM headers" "Multibyte input widget" "http://www.scim-im.org" FALSE "1.4" "Needed for the kimpanel multibyte input Plasmoid")
      if (SCIM_FOUND)
         add_subdirectory(kimpanel)
      endif ( SCIM_FOUND)
   endif (X11_Xrender_FOUND)
endif (Q_WS_X11)
