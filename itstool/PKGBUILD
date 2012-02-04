# Maintainer: Michael Pusterhofer <pusterhofer(at)student(dot)tugraz(dot)at>
pkgname=itstool
pkgver=1.1.1
pkgrel=1
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=('GPL3')
source=(http://files.itstool.org/itstool/$pkgname-$pkgver.tar.bz2)
md5sums=('1ea7e89d3753e84b51efec0339a4e281')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  sed -i -e 's/#!.*python/#!\/usr\/bin\/python2/g' itstool itstool.in
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
