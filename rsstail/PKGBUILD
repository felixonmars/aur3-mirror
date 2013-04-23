# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Evan Gates <evan.gates@gmail.com>
pkgname=rsstail
pkgver=1.8
pkgrel=2
pkgdesc="Monitor and print rss feeds (tail for rss...)"
license=(GPL2)
arch=('i686' 'x86_64')
url=http://www.vanheusden.com/rsstail/
depends=('libmrss')
source=("http://www.vanheusden.com/rsstail/$pkgname-$pkgver.tgz")
md5sums=('4d28a67b67c55c8c6de7c5ab4099faab')

build() {
  cd $srcdir/$pkgname-$pkgver
  #sed -i -e "s/CFLAGS = /CFLAGS = ${CFLAGS} /" -e "s_/share__" Makefile
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
