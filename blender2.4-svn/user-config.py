WITH_BF_OPENMP = True
WITH_BF_VERSE = False
BF_PYTHON_VERSION = '2.6'
WITH_BF_STATICPYTHON = False
WITH_BF_OPENAL = True
BF_OPENAL_LIB = 'openal'
WITH_BF_SDL = True
WITH_BF_OPENEXR = True
WITH_BF_DDS = True
WITH_BF_JPEG = True
WITH_BF_PNG = True
WITH_BF_ZLIB = True
WITH_BF_INTERNATIONAL = True
WITH_BF_FTGL = True
WITH_BF_GAMEENGINE = True
WITH_BF_PLAYER = True
WITH_BF_BULLET = True
WITH_BF_YAFRAY = False
WITH_BF_QUICKTIME = False # -DWITH_QUICKTIME
WITH_BF_ICONV = False
WITH_BF_BINRELOC = True
WITH_BF_FFMPEG = True  # -DWITH_FFMPEG
BF_FFMPEG = '/usr'
BF_FFMPEG_LIB = 'avformat avcodec swscale avutil avdevice'
WITH_BF_OGG = False  # -DWITH_OGG 
WITH_BF_OPENJPEG = True 
WITH_BF_REDCODE = False  
WITH_BF_STATICOPENGL = False
BF_OPENGL = '/usr'
BF_OPENGL_LIBPATH = '/usr/lib'

CCFLAGS = ['-mtune=native','-pipe','-fPIC','-funsigned-char','-fno-strict-aliasing']
CXXFLAGS = ['-mtune=native','-pipe','-fPIC','-funsigned-char','-fno-strict-aliasing']

REL_CFLAGS = ['-O2']
REL_CCFLAGS = ['-O2']
REL_CXXFLAGS = ['-O2']

BF_PROFILE = False
BF_DEBUG = False

BF_BUILDDIR = '../build/linux2'
BF_INSTALLDIR='../install/linux2'
BF_DOCDIR='../install/doc'
