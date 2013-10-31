# Maintainer: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>

_qt_module=qtjsbackend
pkgname="mingw-w64-qt5-jsbackend"
pkgver=5.1.1
pkgrel=2
arch=('any')
pkgdesc="Qt5 for Windows -- QtJsBackend module (mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc' 'python')
options=('!strip' '!buildflags' 'staticlibs')
replaces=("${pkgname/qt5-/qt5-qt}<=5.1.0")
conflicts=("${pkgname/qt5-/qt5-qt}")
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.1/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('7225169d7d166cc5660384a85e4d4a2f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make

    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}

    make INSTALL_ROOT="${pkgdir}" install

    # Rename the .a files to .dll.a as they're actually import libraries and not static libraries
    for FN in "${pkgdir}/usr/${_arch}/lib/"*.a; do
      FN_NEW=$(echo $FN | sed s/'.a$'/'.dll.a'/)
      mv $FN $FN_NEW
    done

    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll
    
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a

    popd
  done

  # .prl files aren't interesting for us
  find "${pkgdir}" -name "*.prl" -delete

}
