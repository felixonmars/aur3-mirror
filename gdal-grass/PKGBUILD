# Maintainer: syntaxerrormmm <syntaxerrormmm (at) gmail.com>
# Maintainer: SaultDon <sault.don gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname=gdal-grass
pkgver=1.11.2
pkgrel=1
pkgdesc="Standalone drivers for GRASS raster and vector files"
arch=('i686' 'x86_64')
url="http://www.gdal.org/dl/"
license=('GPL')
depends=('gdal' 'grass')
makedepends=('fftw')
source=("http://download.osgeo.org/gdal/1.11.2/${pkgname}-${pkgver}.tar.gz"
        'gdal-grass-1.11.2-configure.patch'
        'gdal-grass-1.11.2-configure.in.patch'
        'gdal-grass-1.11.2-Makefile.in.patch'
        'gdal-grass-destdir.patch')
md5sums=('37ea02e8ddab27a3fbae0bcefb659145'
         'f9b208d80f892ed19b465baea9f3f0db'
         '0b9effdd8bb73514b5a45ff2ae750799'
         'c9ba86ffd41020a8629202d5fb1424fb'
         'b56ae94e22d603cb43fdafab39ae35ed')


prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # http://trac.osgeo.org/gdal/ticket/5852
  # these can be dropped in 1.11.3 when it's released
  patch -Np 0 -i "${srcdir}/gdal-grass-1.11.2-configure.patch"
  patch -Np 0 -i "${srcdir}/gdal-grass-1.11.2-configure.in.patch"
  patch -Np 0 -i "${srcdir}/gdal-grass-1.11.2-Makefile.in.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --with-gdal=/usr/bin/gdal-config \
    --with-grass=/opt/grass \
    --with-postgres-includes=/usr/include \
    --with-autoload=$pkgdir/usr/lib/gdalplugins

  patch Makefile "$srcdir/gdal-grass-destdir.patch"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/gdal/grass/etc"
  install -d "$pkgdir/usr/share/gdal/grass/driver/db"

  make DESTDIR="$pkgdir" install
}
