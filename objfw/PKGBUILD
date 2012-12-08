# Maintainer: Florian Zeitz <florob at babelmonkeys dot de>

pkgname=objfw
pkgver=0.7.1
pkgrel=1
pkgdesc="A portable framework for the Objective C language."
arch=('i686' 'x86_64')
url="https://webkeks.org/objfw"
license=('custom:QPL' 'GPL2' 'GPL3')
depends=('sh' 'gcc-libs')
makedepends=('clang')
conflicts=('objfw-git' 'objfw-hg')
source=(https://webkeks.org/objfw/downloads/$pkgname-$pkgver.tar.xz)
md5sums=('c7431dc81bc20889b1515fb0961208ef')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --enable-static --prefix=/usr OBJC="clang"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE.QPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE.QPL"
}

# vim:set ts=2 sw=2 et:
