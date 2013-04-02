cmake_minimum_required(VERSION 2.8)

project(SCHNApps)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -fPIC")


SET(CGoGN_ROOT_DIR ${CMAKE_SOURCE_DIR}/.. CACHE STRING "CGoGN root dir")
SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/../cmake_modules/)

find_package(OpenGL REQUIRED)
find_package(Boost COMPONENTS regex thread system REQUIRED)
find_package(ZLIB REQUIRED)
find_package(LibXml2 REQUIRED)
find_package(GLEW REQUIRED)
find_package(Qt4 REQUIRED)
find_package(QGLViewer REQUIRED)
find_package(PythonLibs 2.7 REQUIRED)
find_package(SuiteSparse REQUIRED)
find_package(CGoGN REQUIRED)


SET( QT_USE_QTOPENGL TRUE )
SET( QT_USE_QTXML TRUE )
SET( QT_USE_QTDESIGNER TRUE )
SET( QT_USE_QTGUI TRUE )
SET( QT_USE_QTPLUGIN TRUE )

INCLUDE(${QT_USE_FILE})
ADD_DEFINITIONS(${QT_DEFINITIONS})




SET(CGoGN_LIBS_R cgogn)

IF (DEFINED ASSERTON)
	add_definitions(-DCGOGN_ASSERT_BOOL=${ASSERTON})
ELSE (DEFINED ASSERTON)
	add_definitions(-DCGOGN_ASSERT_BOOL=false)
ENDIF (DEFINED ASSERTON)

add_definitions(-DSHADERPATH="${CGoGN_ROOT_DIR}/lib/Shaders/")




# define includes of external libs 
SET (EXT_INCLUDES 
 	${CGoGN_EXT_INCLUDES}
 	${CGOGN_INCLUDE_DIRS}
	${OPENGL_INCLUDE_DIR}
	${GLEW_INCLUDE_DIRS}
	${ZLIB_INCLUDE_DIRS}
	${LIBXML2_INCLUDE_DIR}
	${Boost_INCLUDE_DIRS}
	${QT_INCLUDE_DIR}
	${QGLVIEWER_INCLUDE_DIR}
	${PYTHON_INCLUDE_DIRS}
	${SUITESPARSE_INCLUDE_DIRS}
#	${SUPERLU_INCLUDE_DIRS}
)

# define libs for external libs
SET (EXT_LIBS 
 	${CGoGN_EXT_LIBS}
 	${CGOGN_LIBRARIES}
	${OPENGL_LIBRARY}
	${GLEW_LIBRARIES}
	${ZLIB_LIBRARIES}
	${LIBXML2_LIBRARIES}
	${Boost_SYSTEM_LIBRARY}
	${Boost_REGEX_LIBRARY}
	${Boost_THREAD_LIBRARY}
	${QT_LIBRARIES}
	${QGLVIEWER_LIBRARIES}
	${PYTHON_LIBRARIES}
	${SUITESPARSE_LIBRARIES}
#	${SUPERLU_LIBRARIES}
)




SET(SCHNApps_ROOT_DIR ${CMAKE_SOURCE_DIR}/../SCHNApps)
SET(EXECUTABLE_OUTPUT_PATH ${SCHNApps_ROOT_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${SCHNApps_ROOT_DIR}/lib)


file(
	GLOB_RECURSE
	SCHNApps_FILES
	${SCHNApps_ROOT_DIR}/src/*.cpp
	${SCHNApps_ROOT_DIR}/include/*.h
	${SCHNApps_ROOT_DIR}/include/*.hpp
)

file(
	GLOB_RECURSE
	SCHNApps_UI_FILES
	${SCHNApps_ROOT_DIR}/forms/*.ui
)

SET(SCHNApps_QOBJECT_FILES
	${SCHNApps_ROOT_DIR}/include/camera.h
	${SCHNApps_ROOT_DIR}/include/mapHandler.h
	${SCHNApps_ROOT_DIR}/include/plugin.h
	${SCHNApps_ROOT_DIR}/include/view.h
	${SCHNApps_ROOT_DIR}/include/window.h
	${SCHNApps_ROOT_DIR}/include/viewButtonArea.h
	${SCHNApps_ROOT_DIR}/include/dialogs/camerasDialog.h
	${SCHNApps_ROOT_DIR}/include/dialogs/pluginsDialog.h
	${SCHNApps_ROOT_DIR}/include/dialogs/mapsDialog.h
	${SCHNApps_ROOT_DIR}/include/dialogs/cameraViewDialog.h
	${SCHNApps_ROOT_DIR}/include/dialogs/pluginsViewDialog.h
	${SCHNApps_ROOT_DIR}/include/dialogs/mapsViewDialog.h
	${SCHNApps_ROOT_DIR}/include/colorComboBox.h
)



ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/Release Release)
