# Maintainer: Juho Rutila <juho dot rutila at gmail dot com>

pkgname=weborf
pkgver=0.13
pkgrel=2
pkgdesc="A lightweight webserver designed to rapidly share directories"
arch=('i686' 'x86_64')
url="http://code.google.com/p/weborf/"
license=('GPL3')
depends=('file')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/$pkgname\_$pkgver.orig.tar.gz)
md5sums=('4bd205e203ef18f0a0c06ce7f8f5daca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libexecdir="/usr/lib/$pkgname"
  sed -i 's|^cgibindir = .*$|cgibindir = /usr/lib/weborf/cgi-bin|' Makefile cgi_wrapper/Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/etc/" "$pkgdir/usr/share/man/man5"
}
