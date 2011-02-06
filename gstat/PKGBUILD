# Maintainer: Dominik Fuchs <dominik.fuchs@wur.nl>
pkgname=gstat
pkgver=2.5.1
pkgrel=1
pkgdesc="Gstat is a software for multivariable geostatistical modelling, prediction and simulation."
url="http://www.gstat.org"
license="GPL"
arch=('i686' 'x86_64')
depends=(ncurses grass gdal)
source=(http://gstat.org/bin/gstat-2.5.1.tar.gz
	gstat-2.5.1-grass.patch)
md5sums=('d7dbcf3418fd19221ec64825f6b6e2c9'
         '10a1e5820aa4b698e740069c86b133c1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ${startdir}/gstat-2.5.1-grass.patch || return 1
  ./configure --prefix=$startdir/pkg/usr --with-gdal --with-grass6=/opt/grass
  make | return 1
  mkdir $startdir/pkg/usr/ $startdir/pkg/usr/bin
  make install
}
