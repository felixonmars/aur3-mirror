# Maintainer: Flaviu Tamas <tamas.flaviu@gmail.com>
# Contributor: Boohbah <boohbah at gmail dot com>
# Contributor: sudokode <sudokode at gmail dot com>

pkgname=american-fuzzy-lop
_pkgname=afl
pkgver=1.05b
pkgrel=1
pkgdesc="A fuzzer using a novel type of compile-time instrumentation"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop/"
license=('Apache')
depends=('bash')
source=('http://lcamtuf.coredump.cx/afl.tgz')
sha256sums=('5c4ab527fb0aa0bec8f6e22e5492a1f786c8abb0a4b085b362d8977752765321')

prepare() {
  cd $_pkgname-$pkgver
}

build() {
  cd $_pkgname-$pkgver
  make PREFIX=$pkgdir/usr/
}

package() {
  cd $_pkgname-$pkgver
  mkdir -p $pkgdir/usr/{bin,lib,}
  make install PREFIX=$pkgdir/usr/
}
