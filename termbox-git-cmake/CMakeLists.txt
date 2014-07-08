# CMakeLists.txt for termbox
cmake_minimum_required (VERSION 2.8)
project (termbox C)

aux_source_directory (termbox/src TERMBOX_SOURCES)
add_library (termbox SHARED ${TERMBOX_SOURCES})

install (TARGETS termbox LIBRARY DESTINATION lib)
install (FILES termbox/src/termbox.h DESTINATION include)
