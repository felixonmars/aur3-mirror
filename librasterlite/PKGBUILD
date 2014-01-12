# Maintainer: Brian Galey <bkgaley at gmail dot com>
# Contributor: Pietro Zambelli <peter.zamb at gmail dot com>
pkgname=librasterlite
pkgver=1.1g
pkgrel=1
pkgdesc='a library supporting raster data sources within a SpatiaLite DB'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/librasterlite/index'
license=('MPL')
depends=('libspatialite' 'libgeotiff' 'libpng')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('0a8dceb75f8dec2b7bd678266e0ffd5210d7c33e3d01b247e9e92fa730eebcb3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make "DESTDIR=$pkgdir" install
}
