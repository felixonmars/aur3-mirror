# Contributor: hpestilence <hpestilence@gmail.com>
pkgname=osgal-uw
pkgver=20060903
pkgrel=1
pkgdesc="Handles 3d spatial sound in an openscenegraph environment modified by underware."
url="http://www.vrlab.umu.se/research/osgAL/"
license=('LGPL')
arch=('i686')
depends=('openalpp')
makedepends=('pkgconfig')
provides=('osgal')
conflicts=('osgal')
options=(!libtool)
source=(http://download.gna.org/underware/sources/osgal-cvs-$pkgver.tar.gz)
md5sums=('92e67bc580900b9a98ba31e18b47c5f3')

build() {
  cd $startdir/src/osgal-cvs-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
