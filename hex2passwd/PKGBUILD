# Maintainer: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=hex2passwd
pkgver=1
pkgrel=2
pkgdesc="Takes a checksum algorithm and converts it into a string of characters"
arch=(i686 x86_64)
url="http://swift.siphos.be/tools-hex2passwd.html"
depends=('glibc')
makedepends=('gcc')
license=('GPL3')
source=(http://swift.siphos.be/tools/hex2passwd/${pkgname}-${pkgver}.tar.gz)
md5sums=('8219e03f33ddccfe8010f3e7c744e429')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" install
  
  # fix permissions
  chgrp root "$pkgdir/usr/bin/hex2passwd"
  chgrp root "$pkgdir/usr/share/man/man1/hex2passwd.1"
}
