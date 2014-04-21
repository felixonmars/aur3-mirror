project (EZ-Draw C)

cmake_minimum_required(VERSION 2.8)

option(BUILD_SHARED_LIBS "shared|static" ON)

set( headers ez-draw.h ez-image.h)
set (sources ez-draw.c ez-image.c)

if (UNIX)
  find_package(X11 REQUIRED)
endif ()

add_library(ezdraw ${sources})
if (WIN32)
  target_link_libraries(ezdraw msimg32)
  if (BUILD_SHARED_LIBS)
    set_target_properties(ezdraw PROPERTIES SUFFIX "-1.dll")
  endif ()
endif()
if (UNIX)
  target_link_libraries(ezdraw ${X11_LIBRARIES})
endif ()


install (TARGETS ezdraw RUNTIME DESTINATION bin
                        LIBRARY DESTINATION lib${LIB_SUFFIX}
                        ARCHIVE DESTINATION lib${LIB_SUFFIX})

install (FILES ${headers} DESTINATION include)

file (GLOB DEMO_SAMPLES "demo-*.c")
file (GLOB GAME_SAMPLES "jeu-*.c")
install (FILES ${DEMO_SAMPLES} ${GAME_SAMPLES} DESTINATION share/ezdraw/samples)


