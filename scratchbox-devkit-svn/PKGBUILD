# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=scratchbox-devkit-svn
pkgver=1.0
pkgrel=1
pkgdesc="scratchbox devkit svn"
arch=('i686' 'x86_64')
url="http://www.scratchbox.org/"
license=('GPL')
source=(http://www.scratchbox.org/download/files/sbox-releases/stable/tarball/$pkgname-$pkgver-i386.tar.gz)
md5sums=('6abb37175a2f86f1638c877f4437edc2')

build() {
  return 0
}

package() {
  cd "$srcdir"
  cp -R scratchbox "$pkgdir/"
}
