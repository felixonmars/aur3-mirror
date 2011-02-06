#configuration
CONFIG +=  exceptions no_mocdepend release stl qt_no_framework
QT_ARCH = i386
QT_EDITION = OpenSource
QT_CONFIG +=  minimal-config small-config medium-config large-config full-config qt3support accessibility opengl reduce_exports reduce_relocations ipv6 clock-gettime clock-monotonic mremap getaddrinfo ipv6ifname getifaddrs inotify system-jpeg system-mng system-png png system-tiff system-freetype system-zlib nis cups iconv glib dbus openssl-linked x11sm xshape xrender mitshm fontconfig xkb xmlpatterns svg webkit scripttools release

#versioning
QT_VERSION = 4.5.1
QT_MAJOR_VERSION = 4
QT_MINOR_VERSION = 5
QT_PATCH_VERSION = 1

#namespaces
QT_LIBINFIX = 
QT_NAMESPACE = 
QT_NAMESPACE_MAC_CRC = 

QMAKE_RPATHDIR += "/usr/lib"
QT_GCC_MAJOR_VERSION = 4
QT_GCC_MINOR_VERSION = 3
QT_GCC_PATCH_VERSION = 3
