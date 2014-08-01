# Maintainer: SaultDon <sault.don gmail>
# Contributor: Brian Galey <bkgaley at gmail dot com>
# Contributor: Pietro Zambelli <peter.zamb at gmail dot com>
pkgname=librasterlite2
pkgver=1.0.0
pkgrel=2
pkgdesc='A library that stores and retrieves huge raster coverages using a SpatiaLite DBMS.'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/librasterlite2/index'
license=('MPL')
depends=('libspatialite' 'libgeotiff' 'libpng' 'libwebp' 'cairo' 'curl' 'libxml2' 'xz' 'giflib')
provides=('librasterlite2')
conflicts=('librasterlite' 'libgaiagraphics')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-$pkgver-rc0.tar.gz")
md5sums=('2c0c9d41eb29f6e7bee62519eb8ac014')

build() {
    export LIBS="-lpthread"
    cd "$srcdir/$pkgname-$pkgver-rc0"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-rc0"
    make "DESTDIR=$pkgdir" install-strip
}
