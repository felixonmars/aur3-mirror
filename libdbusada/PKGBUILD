# Maintainer: Julian Leyh <julian@vgai.de>

pkgname=libdbusada
pkgver=0.2
pkgrel=1
pkgdesc="Ada binding to the D-Bus message bus"
arch=('i686' 'x86_64')
url="http://www.codelabs.ch/dbus-ada/"
license=('GMGPL')
depends=('gcc-ada')
checkdepends=('ahven')
source=(http://www.codelabs.ch/download/$pkgname-$pkgver.tar.bz2)
md5sums=('e3f676b7d3777818b3356dd0e2d9f772')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
