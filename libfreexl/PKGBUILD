# Maintainer: Brian Galey <bkgaley at gmail dot com>
# Contributor: Bruno Gola <brunogola at gmail dot com>
pkgname=libfreexl
pkgver=1.0.0g
pkgrel=1
pkgdesc="Library to extract valid data from within an Excel (.xls) spreadsheet"
arch=('i686' 'x86_64')
url="https://www.gaia-gis.it/fossil/freexl/index"
license=('MPL')
depends=('glibc')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/freexl-sources/freexl-$pkgver.tar.gz")
sha256sums=('cf2b110f5fc7089fa61c7421f59caa4125b13087b4686ed82dba7abedf2ec266')

build() {
  cd "$srcdir/${pkgname/lib/}-$pkgver"
  LIBS=-lm ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname/lib/}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
