# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: rabyte <rabyte__gmail>

pkgname=usfv
pkgver=1.42
pkgrel=1
pkgdesc="A command-line utility for creating and verifying SFV (Simple File Verification) files"
arch=('i686' 'x86_64')
url="http://www.neillcorlett.com/usfv/"
license=('GPL3')
makedepends=('gcc')
source=(http://www.neillcorlett.com/downloads/cmdpack-1.03-src.tar.gz)
sha256sums=('56a806f075dded183e29e85c9cda2c4662644a310e6916aea688a7b26f4e0a6c')

build() {
  cd ${srcdir}/cmdpack-1.03-src/src

  gcc ${CFLAGS} $pkgname.c -o $pkgname
}

package() {
  cd ${srcdir}/cmdpack-1.03-src/src

  install -m755 -D $pkgname ${pkgdir}/usr/bin/$pkgname
}
