pkgname=freexl
pkgver=1.0.0h
pkgrel=1
pkgdesc="Library for reading Excel (.xls) spreadsheets"
arch=('i686' 'x86_64')
license=('MPL')
url="https://www.gaia-gis.it/fossil/freexl/index"
depends=('glibc')
makedepends=()
source=("http://www.gaia-gis.it/gaia-sins/${pkgname}-${pkgver}.tar.gz")
sha1sums=('093d7fbf04818e95f04ca7e0cbfed2e1ac96fdc9')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  
  ./configure --prefix=/usr --enable-threads --enable-shared
  make
}

check() {
	cd ${srcdir}/$pkgname-$pkgver
	
	make check
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  
  make DESTDIR=${pkgdir} install
}
