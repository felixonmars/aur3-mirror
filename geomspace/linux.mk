CXX = g++
CXXFLAGS = -Os -Wall -Wunused -Wno-format-y2k -fno-exceptions -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE -D_REENTRANT -DGMSP_X11
LDSTATICFLAGS = /usr/lib/libfltk_gl.a -lGLU -lGL /usr/lib/libfltk_images.a -lpng -lz -ljpeg /usr/lib/libfltk.a -lXext -lpthread -ldl -lm  -lX11 -lXpm -lXft -lfontconfig -lXinerama 
SUFFIX = 
TARGET = geomspace
prebuild:

postbuild:
