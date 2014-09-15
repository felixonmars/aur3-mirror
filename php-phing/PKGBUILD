# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-phing
pkgver=2.8.2
pkgrel=1
pkgdesc="PHP5 project build system based on Apache Ant"
url="http://pear.phing.info"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php')

source=(
    http://pear.phing.info/get/phing-${pkgver}.tgz
)

sha256sums=('6de44b5b5aaf5fe9e7606e497e8997c3ba534758d5b8dce719741ffac9c73f59')

build() {
  cd "$srcdir/phing-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/phing-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
}
