SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules )

project(plasmaplugin)

find_package(Qt4 REQUIRED)
# search packages used by KDE
find_package(KDE4 REQUIRED)
# find_package(Plasma REQUIRED)
find_package(X11 REQUIRED)
include (KDE4Defaults)
include (MacroLibrary)
include(MacroOptionalAddSubdirectory)
include(MacroOptionalDependPackage)

if(UNIX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=default")
endif(UNIX)

include(${QT_USE_FILE})
message(Qt_Use_file: ${QT_USE_FILE})

add_definitions(${QT_DEFINITIONS})
add_definitions(-DQT_PLUGIN -DQT_SHARED)

include_directories(${CMAKE_SOURCE_DIR}
		    ${CMAKE_BINARY_DIR}
		    ${X11_INCLUDE_DIR}
		    ${KDE4_INCLUDES}
            ${KDE4_INCLUDE_DIR}
		    ${CMAKE_SOURCE_DIR}/qtbrowserplugin
)

if(WIN32)
    set(MOZPLUGIN_INSTALL_DIR "C:/Program Files/Mozilla Firefox/plugins")
endif(WIN32)

if(UNIX)
    set(MOZPLUGIN_INSTALL_DIR /usr/lib/mozilla/plugins)
endif(UNIX)

set(BIN_INSTALL_DIR ${MOZPLUGIN_INSTALL_DIR})

if(WIN32)
   ADD_CUSTOM_COMMAND( OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/plasmaplugin.obj
                        COMMAND windres.exe
                            -I${CMAKE_CURRENT_SOURCE_DIR}
                            -o ${CMAKE_CURRENT_BINARY_DIR}/plasmaplugin.obj
                            < ${CMAKE_CURRENT_SOURCE_DIR}/src/plasmaplugin.rc
                        )
endif(WIN32)

set(plasmaplugin_SRCS 
         src/fullview.cpp
         src/pluginwidget.cpp
         qtbrowserplugin/qtbrowserplugin.cpp
)

if(UNIX)
    set(plasmaplugin_SRCS
        ${plasmaplugin_SRCS}
        qtbrowserplugin/qtbrowserplugin_x11.cpp
    )
endif(UNIX)

if(WIN32)
    set(plasmaplugin_SRCS
        ${plasmaplugin_SRCS}
        qtbrowserplugin/qtbrowserplugin_win.cpp
        ${CMAKE_CURRENT_BINARY_DIR}/plasmaplugin.obj 
    )
endif(WIN32)

set(plasmaplugin_MOC_HDRS 
              src/fullview.h
              src/pluginwidget.h
)

SET(plasmaplugindemo_SRCS
        src/main.cpp
)

QT4_WRAP_CPP(plasmaplugin_MOC_SRCS ${plasmaplugin_MOC_HDRS})

add_library(plasmaplugin MODULE
            ${plasmaplugin_SRCS}
	        ${plasmaplugin_MOC_SRCS}
)

add_executable(plasmaplugindemo
               ${plasmaplugin_SRCS}
               ${plasmaplugin_MOC_SRCS}
               ${plasmaplugindemo_SRCS}
)

if(WIN32)
    set_target_properties(plasmaplugin PROPERTIES LINK_FLAGS
                      "-enable-stdcall-fixup -Wl,${CMAKE_SOURCE_DIR}/qtbrowserplugin/qtbrowserplugin.def"
    )
endif(WIN32)

target_link_libraries(plasmaplugin
                      ${QT_LIBRARIES}
                      ${X11_LIBRARIES}
                      ${KDE4_PLASMA_LIBS}
                      ${KDE4_KIO_LIBS})

target_link_libraries(plasmaplugindemo
                      ${QT_LIBRARIES}
                      ${X11_LIBRARIES}
                      ${KDE4_PLASMA_LIBS}
                      ${KDE4_KIO_LIBS})

install(TARGETS plasmaplugin DESTINATION ${MOZPLUGIN_INSTALL_DIR})
install(TARGETS plasmaplugindemo DESTINATION ${BIN_INSTALL_DIR})
