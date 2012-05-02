# Maintainer: Gero Müller <post@geromueller.de>

pkgname=parsec-hg
pkgver=375
pkgrel=1
pkgdesc="Parametrized Simulation Engine for Cosmic Rays"
url="http://www.physik.rwth-aachen.de/parsec"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gsl' 'boost' 'pxl' 'python2')
makedepends=('mercurial' 'cmake' 'swig' 'doxygen')

_hgroot='https://forge.physik.rwth-aachen.de/public-hg'
_hgrepo='parsec'

build() {
	cd $srcdir/${_hgrepo}
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE=`which python2` -DPXL_PLUGIN_INSTALL_PATH=/usr/lib/pxl-3.1/plugins
	make || return 1
}

package() {
  cd $srcdir/${_hgrepo}
  make DESTDIR=$pkgdir install
}
