# Maintainer: David Herrmann <dh.herrmann@gmail.com>
pkgname=libtsm
pkgver=3
pkgrel=2
pkgdesc='Terminal-emulator State Machine'
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/kmscon/$pkgname"
license=('MIT')
depends=()
makedepends=('libxkbcommon')
provides=('libtsm')
conflicts=('kmscon<=7')
options=(!libtool !strip)
source=(http://www.freedesktop.org/software/kmscon/releases/$pkgname-$pkgver.tar.xz)
#source=($pkgname-$pkgver.tar.xz)
md5sums=('c1b297a69d11a72f207ec35ae5ce7d69')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --enable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"

  make DESTDIR="$pkgdir/" install
}
