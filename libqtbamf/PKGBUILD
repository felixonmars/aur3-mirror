# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libqtbamf
pkgver=0.2.3
pkgrel=1
pkgdesc="Provides a set of Qt bindings for libbamf"
arch=('i686' 'x86_64')
url="https://launchpad.net/bamf-qt"
license=('GPL')
depends=('qt' 'bamf')
makedepends=('cmake')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('0855bd710efab80141bcbca6527c3136')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
