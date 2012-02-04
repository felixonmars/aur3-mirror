# Maintainer: Nathan Marrow <nathan@nathanmarrow.com>
pkgname=hws
pkgver=0.1.1
pkgrel=1
pkgdesc="An ncurses-based homework planner"
arch=('i686' 'x86_64')
url="http://code.google.com/p/hws-homework-scheduler/"
license=('GPL2')
depends=('gcc-libs' 'ncurses' 'libcdk')
source=("http://hws-homework-scheduler.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('ed1c6a625fb87d1af170dfc0a95921fe')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
