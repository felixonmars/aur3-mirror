# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=burp
pkgver=1.6.7
pkgrel=1
pkgdesc="A simple AUR uploader"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/burp"
license=('GPL')
depends=('curl')
makedepends=('perl')
source=("https://github.com/downloads/falconindy/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2cb0e8f09b8aacb27d80697155d5856b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=${pkgdir} MANPREFIX=/usr/share/man install
}

# vim: ft=sh syn=sh
