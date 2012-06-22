# Maintainer: Tim Rice <t DOT rice AT ms DOT unimelb DOT edu DOT au>
pkgname=nanoserv
pkgver=2.1.1
pkgrel=1
pkgdesc="A PHP server daemon framework."
arch=(any)
url="http://nanoserv.si.kz/"
license=('GPL')
depends=('php' 'php-pear')
makedepends=('make')
source=(${url}/downloads/$pkgname-$pkgver.tgz)
md5sums=('9068bfa093571a4af82d26b4c7e67d81')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure -i /usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
