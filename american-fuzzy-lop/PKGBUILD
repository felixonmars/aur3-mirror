# Maintainer: Boohbah <boohbah at gmail dot com>
# Contributor: sudokode <sudokode at gmail dot com>

pkgname=american-fuzzy-lop
_pkgname=afl
pkgver=0.21b
pkgrel=1
pkgdesc="A fuzzer using a novel type of compile-time instrumentation"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop/"
license=('Apache')
source=('http://lcamtuf.coredump.cx/afl.tgz')
md5sums=('cf3db0803db5700633e9cc85e0ba2be0')

prepare() {
  cd $_pkgname-$pkgver
  # Fix paths because there is no configure script
  sed -i "s:/usr/local/bin:${pkgdir}/usr/bin:" Makefile
  sed -i "s:/usr/local/lib:${pkgdir}/usr/lib:" Makefile
}

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  mkdir -p $pkgdir/usr/{bin,lib,}
  make install
}
