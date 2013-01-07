# Maintainer: Leo von Klenze <devel@leo.von-klenze.de>
pkgname=mingw-w64-xalan-c
pkgver=1.11
pkgrel=3
pkgdesc="An XSLT processing library"
arch=(any)
url="http://xalan.apache.org/xalan-c"
license=('APACHE')
makedepends=(sed mingw-w64-gcc mingw-w64-xerces-c=3.1.1 xerces-c)
depends=(mingw-w64-crt mingw-w64-xerces-c=3.1.1)
options=(!libtool !strip !buildflags)
source=(http://apache.mirror.iphh.net/xalan/xalan-c/sources/xalan_c-$pkgver-src.tar.gz)
md5sums=(9227d3e7ab375da3c643934b33a585b8)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    local xalan_source="${srcdir}/${pkgname#mingw-w64-}-${pkgver}/c"
    export XERCESCROOT=/usr

    echo "Build Message Creator"

    export BITSTOBUILD=32
    export TRANSCODER=
    export XALAN_LOCALE_SYSTEM=inmem
    export XALAN_LOCALE=en_US
    export CXXFLAGS="-O3 -DNDEBUG  -pthread -D_REENTRANT"
    export CFLAGS="-O3 -DNDEBUG  -pthread -D_REENTRANT"
    export LDFLAGS="-pthread -D_REENTRANT"
    export LIBS="-lpthread"
    
    export XALANCROOT="${srcdir}/xalan-c-build-linux"
    mkdir -p "$XALANCROOT"
    cp -r "$xalan_source/"* "$XALANCROOT"
    cd "$XALANCROOT"
    ./configure
    make -j1

    echo "Build Xalan"

    for _arch in ${_architectures}; do
      export XERCESCROOT=/usr/${_arch}
      if [ "${_arch}" = "i686-w64-mingw32" ]; then
        export BITSTOBUILD=32
      else
        export BITSTOBUILD=64
      fi
      export CXXFLAGS="-O -DNDEBUG -mthreads"
      export CFLAGS="-O -DNDEBUG -mthreads"
      export LDFLAGS="-mthreads"
      export LIBS="-mthreads"  

      export XALANCROOT="${srcdir}/xalan-c-build-${_arch}"
      mkdir -p "$XALANCROOT"
      cp -r "$xalan_source/"* "$XALANCROOT"
      mkdir -p "$XALANCROOT/bin"
      cp "${srcdir}/xalan-c-build-linux/bin/MsgCreator" "$XALANCROOT/bin"
      cd "$XALANCROOT"

      sed -i "s/dllwrap/${_arch}-dllwrap/g" Makefile.incl.in
      sed -i "s/c++/${_arch}-c++/g" Makefile.incl.in
      sed -i 's/XalanExe: lib  $(XSL_BIN_DIR)\/Xalan/XalanExe: lib  $(XSL_BIN_DIR)\/Xalan$(EXT)/g' src/xalanc/Makefile.in
      sed -i 's/$(XSL_BIN_DIR)\/Xalan: ${XSL_OBJ_DIR}\/XalanExe.o/$(XSL_BIN_DIR)\/Xalan$(EXT): ${XSL_OBJ_DIR}\/XalanExe.o/g' src/xalanc/Makefile.in
      ./configure \
          --prefix=/usr/${_arch} \
          --build=$CHOST \
          --host=${_arch}
      make -j1 
    done
}

package() {
  for _arch in ${_architectures}; do
    export XERCESCROOT=/usr/${_arch}
    if [ "${_arch}" = "i686-w64-mingw32" ]; then
      export BITSTOBUILD=32
    else
      export BITSTOBUILD=64
    fi  
    export CXXFLAGS="-O -DNDEBUG -mthreads"
    export CFLAGS="-O -DNDEBUG -mthreads"
    export LDFLAGS="-mthreads"
    export LIBS="-mthreads"  

    export XALANCROOT="${srcdir}/xalan-c-build-${_arch}"

    cd "${srcdir}/xalan-c-build-${_arch}"
    make DESTDIR="$pkgdir" install    
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g 
    rm -r "$pkgdir/usr/${_arch}/bin"
  done
}

# vim:set ts=2 sw=2 et:
