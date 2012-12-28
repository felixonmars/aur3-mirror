# Maintainer: TDY <tdy@gmx.com>

pkgname=remake
pkgver=3.82_0.9
pkgrel=1
pkgdesc="A modernized GNU make utility with improved tracing, error reporting, and debugging"
arch=('i686' 'x86_64')
url="http://bashdb.sourceforge.net/remake/"
license=('GPL')
depends=('readline')
install=$pkgname.install
source=(http://downloads.sourceforge.net/bashdb/$pkgname-${pkgver%_*}+dbg${pkgver/*_}.tar.bz2)
md5sums=('32eda617a0f64c9314dd6ac17a837de8')

build() {
  cd "$srcdir/$pkgname-${pkgver%_*}+dbg${pkgver/*_}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver%_*}+dbg${pkgver/*_}"
  make DESTDIR="$pkgdir" install
}
