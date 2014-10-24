#!/bin/sh
mingw_prefix=/usr/@TRIPLE@

export PKG_CONFIG_LIBDIR="${mingw_prefix}/lib/pkgconfig"

export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"

PATH=${mingw_prefix}/bin:$PATH cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${mingw_prefix} \
    -DCMAKE_INSTALL_LIBDIR:PATH=${mingw_prefix}/lib \
    -DINCLUDE_INSTALL_DIR:PATH=${mingw_prefix}/include \
    -DLIB_INSTALL_DIR:PATH=${mingw_prefix}/lib \
    -DSYSCONF_INSTALL_DIR:PATH=${mingw_prefix}/etc \
    -DSHARE_INSTALL_DIR:PATH=${mingw_prefix}/share \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-@TRIPLE@.cmake \
    "$@"
    
