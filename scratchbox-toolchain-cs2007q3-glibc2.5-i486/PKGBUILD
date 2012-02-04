# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=scratchbox-toolchain-cs2007q3-glibc2.5-i486
pkgver=1.0.16
pkgrel=1
pkgdesc="scratchbox cs2007q3-glibc2.5-i486 toolchain"
arch=('i686' 'x86_64')
url="http://www.scratchbox.org/"
license=('GPL')
source=(http://www.scratchbox.org/download/files/sbox-releases/hathor/tarball/$pkgname-$pkgver-$pkgrel-i386.tar.gz)
md5sums=('b621bab4998edbbd609e32cdb163d0d6')

build() {
  return 0
}

package() {
  cd "$srcdir"
  cp -R scratchbox "$pkgdir/"
}
