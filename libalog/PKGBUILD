# Maintainer: Julian Leyh <julian@vgai.de>

pkgname=libalog
pkgver=0.4
pkgrel=1
pkgdesc="a stackable logging framework for Ada"
arch=('i686' 'x86_64')
url="http://www.codelabs.ch/alog/"
license=('GPL')
depends=('gcc-ada')
source=(http://www.codelabs.ch/download/$pkgname-$pkgver.tar.bz2
        patchgpr)
md5sums=('12f975400b958cf85683fe5a08c623d6'
         'bcaf28d8683a778ce4f4d780643ddc96')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/patchgpr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  cd "$pkgdir/usr/lib" && mv alog/*.so* .
}
