# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=cvsync
pkgver=0.24.19
pkgrel=1
pkgdesc="A portable CVS repository synchronization utility"
arch=('i686' 'x86_64')
url="http://www.cvsync.org/"
license=('BSD')
depends=('openssl')
options=('!emptydirs')
source=(ftp://ftp.$pkgname.org/pub/$pkgname/$pkgname-$pkgver.tar.gz
        LICENSE)
md5sums=('2d4de4516a6698bd25d7f7fef7d55486'
         'e64fe50f27b35278160f2c1ef1f19001')
sha1sums=('a3c0673bf0f3b81b1eb45ac828a527d2a4e6d2f6'
          'a1ac780be68e6b4e498b31afbf629de367fb2e14')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr \
       MANDIR=/usr/share/man \
       HASH_TYPE=openssl || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" \
       MANDIR="$pkgdir/usr/share/man" \
       HASH_TYPE=openssl \
       INSTALL='/bin/install -D' \
       BINOWN=root \
       BINGRP=root install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
