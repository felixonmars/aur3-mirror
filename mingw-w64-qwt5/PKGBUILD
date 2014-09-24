pkgname=mingw-w64-qwt5
pkgver=5.2.3
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw-w64)"
arch=('any')
license=('custom:qwt')
url="http://qwt.sourceforge.net"
depends=('mingw-w64-qt4')
makedepends=('mingw-w64-gcc')
conflicts=('mingw-w64-qwt')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/qwt/qwt-${pkgver}.tar.bz2")
md5sums=('7d37a11d02bc7d095d0ca6427ec97b8d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
   
  cd "${srcdir}/qwt-${pkgver}"

  # Build release only
  sed -i 's|+= debug_and_release|+= release|' qwtconfig.pri
  sed -i '/+= build_all/d' qwtconfig.pri

  # No designer plugin:
  sed -i 's|CONFIG     += QwtDesigner|#CONFIG     -= QwtDesigner|' qwtconfig.pri

  # Make install locations consistent with Arch's native Qwt:
  sed -i 's|INSTALLBASE/include|INSTALLBASE/include/qwt|' qwtconfig.pri

  # No need for docs:
  sed -i "s|= target headers doc|= target headers|" src/src.pro

  # backup qwtconfig.pri 
  cp qwtconfig.pri qwtconfig.pri.orig

  for _arch in ${_architectures}; do
    
    export QTDIR=/usr/${_arch}/
    export PATH=${QTDIR}/bin:${PATH}
    mkdir -p build-${_arch} && pushd build-${_arch}

    # This is a mingw build, so Windows prefix is used. Let's change it:
    cp ../qwtconfig.pri.orig ../qwtconfig.pri 
    sed -i "s|C:/Qwt-\$\$VERSION|/usr/${_arch}|" ../qwtconfig.pri

    ${QTDIR}/bin/qmake ../qwt.pro
    make src/Makefile
    make textengines/Makefile
    sed -i "s|libqwt5.a|libqwt5.dll.a|g" src/Makefile.Release
    make QMAKE=echo
    popd

    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    cp ../qwtconfig.pri.orig ../qwtconfig.pri
    sed -i "s|C:/Qwt-\$\$VERSION|/usr/${_arch}|" ../qwtconfig.pri
    sed -i "/QwtDll/d" ../qwtconfig.pri
    ${QTDIR}/bin/qmake ../qwt.pro
    make src/Makefile
    make textengines/Makefile
    make QMAKE=echo
    popd    
 
  done

}

package() {

  for _arch in ${_architectures}; do
    cd "${srcdir}/qwt-${pkgver}/build-${_arch}-static"
    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/${_arch}/ QMAKE=echo install
    mv "$pkgdir"/usr/${_arch}/lib/libqwt.a "$pkgdir"/usr/${_arch}/lib/libqwt5.a
 
    cd "${srcdir}/qwt-${pkgver}/build-${_arch}"
    make INSTALL_ROOT=${pkgdir} QTDIR=/usr/${_arch}/ QMAKE=echo install
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

