# Maintainer: Filip Brcic <brcha@gna.org>

_qt_module=qttools
pkgname="mingw-w64-qt5-${_qt_module}"
pkgver=5.0.2
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtTools module (mingw-w64)"
depends=('mingw-w64-qt5-qtbase')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags)
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://releases.qt-project.org/qt5/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('93ddcfdb87c6a784b0a921d09eafbdad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd ${srcdir}/${_pkgfqn}

  # Wtf, pixeltool wants to make into /usr/*/bin/pixeltool.exe, who wrote this .pro file???
  sed -e 's|^DESTDIR|#DESTDIR|g' -i src/pixeltool/pixeltool.pro

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    
    # Something is messed up with Qt5Bootstrap, so let's include -lz by hand for now
    make qmake_all
    sed -e 's|-lQt5Bootstrap|-lQt5Bootstrap -lz|g' -i src/linguist/lrelease/Makefile

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
      # With the exception of Qt5UiTools...
      echo $FN | grep -q Qt5UiTools && continue

      FN_NEW=$(echo $FN | sed s/'.a$'/'.dll.a'/)
      mv $FN $FN_NEW
    done

    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f ${pkgdir}/usr/${_arch}/lib/*.dll

    # Make sure the executables don't conflict with their mingw-qt4 counterpart
    for fn in ${pkgdir}/usr/${_arch}/bin/*.exe ; do
      fn_new=$(echo $fn | sed s/'.exe$'/'-qt5.exe'/)
      mv $fn $fn_new
    done

    # Symlink lrelease to /usr/bin
    mkdir -p ${pkgdir}/usr/bin
    mv ${pkgdir}/usr/${_arch}/bin/lrelease ${pkgdir}/usr/${_arch}/bin/lrelease-qt5
    ln -s ../${_arch}/bin/lrelease-qt5 ${pkgdir}/usr/bin/${_arch}-lrelease-qt5

    ${_arch}-strip --strip-all ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/lib/*.dll.a

    popd
  done

  # .prl files aren't interesting for us
  find ${pkgdir} -name "*.prl" -delete
}
