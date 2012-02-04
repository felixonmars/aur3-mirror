# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libqtdee
pkgver=0.2.3
pkgrel=3
pkgdesc="Provides a set of Qt bindings for libdee"
arch=('i686' 'x86_64')
url="https://launchpad.net/dee-qt"
license=('GPL')
depends=('qt' 'dee')
makedepends=('cmake')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.orig.tar.gz
        pkgconfig.patch)
md5sums=('d60c0ea3ecbb5a6154bf0d878474e694'
         '9ba573720c18a1e4529495dde8c5d1da')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/pkgconfig.patch"

  # Fix imports directory
  sed -i 's|lib/qt4/imports|${QT_IMPORTS_DIR}|' CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
