# Maintainer: Gabriel Ebner <gebner@gebner.org>
pkgname=epr-api-git
pkgver=2.2.r70.gc963751
pkgrel=1
pkgdesc="Envisat Reader API for C"
arch=('x86_64')
url="https://github.com/bcdev/epr-api"
license=('GPL3')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname::git+https://github.com/bcdev/epr-api")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
