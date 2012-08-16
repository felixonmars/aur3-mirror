# Maintainer:  Michiel Broek <mbse at mbse eu>

pkgname=modemu
pkgver=0.0.1
pkgrel=1
pkgdesc="Modemu adds TELNET capability to a comm program."
arch=('i686' 'x86_64')
url="http://www.ibiblio.org/pub/linux/apps/serialcomm/dialout/"
license=('GPL')
depends=(glibc)
makedepends=(flex)
source=(http://www.ibiblio.org/pub/linux/apps/serialcomm/dialout/$pkgname-$pkgver.tar.gz
	modemu-0.0.1.diff)

md5sums=('cb85ee2ce08ac79315b1e80a094ddf50'
         'b422c367595edc29020e0a838464ddc5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Debian patch
  cat "$srcdir/$pkgname-$pkgver.diff" | patch -p1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  install -m 755 modemu $pkgdir/usr/bin

  mkdir -p $pkgdir/usr/share/man/man1
  install -m 644 modemu.1 $pkgdir/usr/share/man/man1

  mkdir -p $pkgdir/usr/share/doc/$pkgname-$pkgver
  cp -a README TODO QuickStart $pkgdir/usr/share/doc/$pkgname-$pkgver
}

