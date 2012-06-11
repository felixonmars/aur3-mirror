# Maintainer: Bruno Gola <brunogola at gmail dot com>
pkgname=libspatialite-freexl
pkgver=3.0.1
pkgrel=1
pkgdesc="SQLite extension to support spatial data types and operations (libfreexl enabled)"
arch=('i686' 'x86_64')
url="https://www.gaia-gis.it/fossil/libspatialite/index"
license=('MPL')
provides=("libspatialite=$pkgver")
conflicts=("libspatialite")
depends=('geos' 'proj' 'sqlite3' 'libfreexl')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/libspatialite-3.0.1.tar.gz")
md5sums=('450d1a0d9da1bd9f770b7db3f2509f69')
build() {
    cd "$srcdir/libspatialite-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/libspatialite-$pkgver"
    make DESTDIR="$pkgdir/" install
}
