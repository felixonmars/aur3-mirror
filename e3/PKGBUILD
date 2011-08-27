# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=e3
pkgver=2.8
pkgrel=1
pkgdesc="A full-screen text editor written in assembly"
arch=('x86_64' 'i686')
url="http://sites.google.com/site/e3editor/"
license=('GPL2')
makedepends=('nasm')
source=("http://sites.google.com/site/e3editor/Home/$pkgname-$pkgver.tgz")
md5sums=('0120bb073133ad26a054b35f88333183')
options=(!strip)
  
build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  msg2 "Configuring..."
  # Fix the symbolic links in /usr/bin
  sed -i 's:$(BINDIR)/e3 :e3 :' Makefile
  make clean

  msg2 "Compiling..."
  make EXMODE=_
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install
  install -Dm644 COPYING.GPL "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
