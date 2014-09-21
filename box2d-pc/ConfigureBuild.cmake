# Create the pkg-config package files
  set(Box2D_LIB_SUFFIX "")
  set(Box2D_ADDITIONAL_LIBS "")
  set(Box2D_CFLAGS "")
  set(Box2D_PREFIX_PATH ${CMAKE_INSTALL_PREFIX})
  configure_file(${Box2D_SOURCE_DIR}/CMake/Box2D.pc.in ${Box2D_BINARY_DIR}/pkgconfig/Box2D.pc @ONLY)
  install(FILES ${Box2D_BINARY_DIR}/pkgconfig/Box2D.pc DESTINATION lib/pkgconfig)
