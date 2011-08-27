# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=kicad-doc-bzr
pkgver=116
pkgrel=1
pkgdesc="Kicad user documentation"
arch=('i686' 'x86_64')
url="http://iut-tice.ujf-grenoble.fr/kicad/"
license=('GPL')
makedepends=('cmake' 'bzr')
options=('docs')
source=()
md5sums=()
_bzrtrunk="lp:~kicad-developers/kicad/doc"
_bzrmod="kicad-doc"

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
  cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr || return 1
}

package() {
  cd ${srcdir}/${_bzrmod}/build/Release

  make DESTDIR=${pkgdir} install
}
