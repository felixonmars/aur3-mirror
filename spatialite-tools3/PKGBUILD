# Maintainer: Bruno Gola <brunogola at gmail dot com>
pkgname=spatialite-tools3
pkgver=3.0.0
pkgrel=1
pkgdesc="Collection of CLI tools supporting SpatiaLite."
arch=('i686' 'x86_64')
url="https://www.gaia-gis.it/fossil/spatialite-tools/index"
license=('GPLv3')
depends=('libspatialite' 'libfreexl')
source=("http://www.gaia-gis.it/gaia-sins/spatialite-tools-sources/spatialite-tools-3.0.0-stable.tar.gz")
md5sums=('b54f94eb5297c1cff1820c2a35752a9c')

build() {
    cd "$srcdir/spatialite-tools-$pkgver-stable"
    ./configure --prefix=/usr 
    make
}

package() {
    cd "$srcdir/spatialite-tools-$pkgver-stable"
    make DESTDIR="$pkgdir/" install
}
