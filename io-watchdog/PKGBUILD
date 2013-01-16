# Maintainer: TDY <tdy@archlinux.info>

pkgname=io-watchdog
pkgver=0.8
pkgrel=1
pkgdesc="A facility for monitoring user applications and parallel jobs for I/O hangs"
arch=('i686' 'x86_64')
url="http://code.google.com/p/io-watchdog/"
license=('GPL')
depends=('glibc')
checkdepends=('expect')
options=('!libtool')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('e682c8cee63d34aa2a84fc5d081a5dd4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
