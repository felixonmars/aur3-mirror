# Maintainer: JHeaton <jheaton at archlinux dot us>
pkgname=tsdl
pkgver=0.1.rc3
pkgrel=1
pkgdesc="A small widget and events library for SDL"
arch=('i686' 'x86_64')
url="http://sandbox.ltmnet.com/tsdl"
license=('GPL3')
depends=('sdl')
source=("http://sandbox.ltmnet.com/files/downloads/all/$pkgname/$pkgname-0.1-rc3.tar.bz2")
md5sums=('3b35d77d821d4c9fd89e15a9c09f1b71')

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" BIN_DIR="$pkgdir/usr/bin" install
}
