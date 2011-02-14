# Maintainer: Christos Nouskas <nous at archlinux dot us>

pkgname=crswallow
pkgver=0.2
pkgrel=1
pkgdesc="A text filter for Linux/Unix environments. It processes text lines passed in from stdin and forwards most of them to stdout/stderr."
arch=('i686' 'x86_64')
url="http://code.google.com/p/crswallow/"
license=('MPL')
makedepends=('gcc' 'make')
source=(http://crswallow.googlecode.com/files/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  install -d -m755 $pkgdir/usr/bin
  install -D -m755 $pkgname $pkgdir/usr/bin/
}

#
sha256sums=('9b7562705d11fedef20b4718a2ed4abcbfd31706c93b4043553a0a3c2fadfa90')
