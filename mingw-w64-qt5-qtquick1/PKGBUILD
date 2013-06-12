# Maintainer: Filip Brcic <brcha@gna.org>

_qt_module=qtquick1
pkgname="mingw-w64-qt5-${_qt_module}"
pkgver=5.0.2
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtQuick1 module (mingw-w64)"
depends=('mingw-w64-qt5-qtbase' 'mingw-w64-qt5-qtscript' 'mingw-w64-qt5-qttools')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags)
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://releases.qt-project.org/qt5/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('22cd03e2e2aadbc5e2ce324a3526fa8b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd ${srcdir}/${_pkgfqn}

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make

    popd
  done
}

package() {
  cd ${srcdir}/${_pkgfqn}

  for _arch in ${_architectures}; do
    pushd build-${_arch}

    make INSTALL_ROOT=$pkgdir install

    # Rename the .a files to .dll.a as they're actually import libraries and not static libraries
    for FN in ${pkgdir}/usr/${_arch}/lib/*.a
    do
      FN_NEW=$(echo $FN | sed s/'.a$'/'.dll.a'/)
      mv $FN $FN_NEW
    done

    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f ${pkgdir}/usr/${_arch}/lib/*.dll

    # Prevent file conflict with mingw-qt4
    mv ${pkgdir}/usr/${_arch}/bin/qmlviewer.exe ${pkgdir}/usr/${_arch}/bin/qmlviewer-qt5.exe

    ${_arch}-strip --strip-all ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/lib/*.dll.a
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/lib/qt5/plugins/*/*.dll
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/share/qt5/imports/Qt/labs/*/*.dll

    popd
  done

  # .prl files aren't interesting for us
  find ${pkgdir} -name "*.prl" -delete
}
