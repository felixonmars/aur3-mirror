# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=cower-legacy
_tarname=cower
pkgver=3.0.5
pkgrel=2
pkgdesc="last stable cower version support pacman version < 4.0"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/cower"
license=('MIT')
depends=('curl' 'yajl' 'pacman<4')
makedepends=('perl')
conflicts=('cower')
provides=('cower')
source=("https://github.com/downloads/falconindy/$_tarname/$_tarname-$pkgver.tar.gz"
        "backports.patch")
md5sums=('ec9abe3a458257d6389bff35722d32a9'
         '42dc38eb6ee699f4967da4fc7be39ff5')

build() {
  cd "$srcdir/$_tarname-$pkgver"

  # glorious, glorious backports
  patch -Np1 <"$srcdir/backports.patch"

  LDFLAGS+=' -lcrypto ' make
}

package() {
  cd "$srcdir/$_tarname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh
