# Maintainer: David Herrmann <dh.herrmann@googlemail.com>
pkgname=lgcom
pkgver=1.0
pkgrel=1
pkgdesc='Library and tools to control LG TVs via COM-Port RS-232 / TTY'
arch=('i686' 'x86_64')
url="http://github.com/dvdhrm/umpc"
license=('BSD')
depends=('glibc')
options=(!libtool)
source=(https://github.com/downloads/dvdhrm/umpc/$pkgname-$pkgver.tar.bz2)
#source=($pkgname-$pkgver.tar.bz2)
md5sums=('a6a21bce83d4f3f8ff12e8697b1f0687')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  make DESTDIR="$pkgdir/" install
}
