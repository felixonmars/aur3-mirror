# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=pinger
pkgver=0.32d
pkgrel=1
pkgdesc="A cyclic multi ping utility for selected addresses using GTK/ncurses"
arch=('i686' 'x86_64')
url="http://aa.vslib.cz/silk/projekty/pinger/index.php"
license=('GPL')
depends=('gtk2' 'ncurses')
source=(http://aa.vslib.cz/silk/projekty/pinger/download/$pkgname-$pkgver.tar.gz)
md5sums=('18c4d90ed921e2ff160d6a0ed397e361')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
