# Maintainer: Adam Ehlers Nyholm Thomsen <adament at gmail dot com>

pkgname=c2ps
pkgver=4.0
pkgrel=3
pkgdesc="C/C++ to Postscript Converter"
arch=('i686' 'x86_64')
url="http://www.cs.technion.ac.il/users/c2ps/"
license=('GPL2')
groups=()
depends=()
makedepends=()
optdepends=()
source=(http://www.cs.technion.ac.il/users/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('195553258f2f18198f164ea8f66362dc')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  mkdir -p $pkgdir/usr/man/man1 $pkgdir/usr/bin
  make PREFIX=$pkgdir/usr install || return 1
}
