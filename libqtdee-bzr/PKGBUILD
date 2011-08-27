# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=libqtdee-bzr
pkgver=38
pkgrel=1
pkgdesc="Qt bindings for libdee"
arch=('i686' 'x86_64')
url="https://launchpad.net/dee-qt"
license=('GPL')
depends=('qt' 'dee-bzr')
makedepends=('cmake' 'bzr')
source=('libqtdee.pc')
md5sums=('a7b0e53bedcb38df4edd205ba926e680')
conflicts=('libqtdee')
provides=('libqtdee')
groups=('unity2d-bzr')

_bzrtrunk=lp:dee-qt
_bzrmod=dee-qt

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
  install -D -m644 $srcdir/libqtdee.pc ${pkgdir}/usr/lib/pkgconfig/libqtdee.pc
}
