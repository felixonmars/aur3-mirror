# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=libqtgconf-bzr
pkgver=35
pkgrel=1
pkgdesc="Qt bindings for GConf"
arch=('i686' 'x86_64')
url="http://launchpad.net/gconf-qt"
license=('GPL')
depends=('qt' 'gconf')
makedepends=('cmake' 'bzr')
provides=('libqtgconf')
conflicts=('libqtgconf')
groups=('unity2d-bzr')

_bzrtrunk=lp:gconf-qt
_bzrmod=gconf-qt

build() {
  cd "$srcdir"
  
  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build 
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $srcdir/$_bzrmod -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
