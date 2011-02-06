# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=scratchbox-devkit-git
pkgver=1.0.2
pkgrel=1
pkgdesc="scratchbox devkit git"
arch=('i686' 'x86_64')
url="http://www.scratchbox.org/"
license=('GPL')
source=(http://www.scratchbox.org/download/files/sbox-releases/hathor/tarball/$pkgname-$pkgver-i386.tar.gz)
md5sums=('7cb09f0ba532f710b836f367e41d23b6')

build() {
  return 0
}

package() {
  cd "$srcdir"
  cp -R scratchbox "$pkgdir/"
}
