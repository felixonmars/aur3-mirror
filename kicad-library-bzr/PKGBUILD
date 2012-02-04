# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=kicad-library-bzr
pkgver=94
pkgrel=1
pkgdesc="Kicad component libraries"
arch=('any')
url="http://iut-tice.ujf-grenoble.fr/kicad/"
license=('GPL')
makedepends=('cmake' 'bzr')
source=()
md5sums=()
_bzrtrunk="lp:~kicad-lib-committers/kicad/library"
_bzrmod="kicad-library"

build() {
  cd ${srcdir}
  msg "Connecting to BZR server..." 
  if [ ! -d ${srcdir}/${_bzrmod} ] ; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi
  msg "BZR checkout done or server timeout"

  mkdir -p ${srcdir}/${_bzrmod}/build/Release
  cd ${srcdir}/${_bzrmod}/build/Release
  cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd ${srcdir}/${_bzrmod}/build/Release

  make DESTDIR=${pkgdir} install
}
