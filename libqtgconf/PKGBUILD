# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libqtgconf
pkgver=0.1
pkgrel=2
pkgdesc="Provides a set of Qt bindings for GConf"
arch=('i686' 'x86_64')
url="https://launchpad.net/gconf-qt"
license=('GPL')
depends=('qt' 'gconf')
makedepends=('cmake')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('c610ef0fd6d09c98371bfd1d80452ccf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix imports directory
  sed -i 's|lib/qt4/imports|${QT_IMPORTS_DIR}|' CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
