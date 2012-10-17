# Maintainer: Martin Engelmann <murphi dot oss at googlemail dot com>
pkgname=icord-viewer
pkgver=0.2.1
pkgrel=5
epoch=
pkgdesc="Download and manage recordings on Humax iCord HD"
arch=(i686 x86_64)
url="http://gitorious.org/icord-viewer"
license=('GPL')
groups=()
depends=(kdebase-lib boost)
makedepends=(cmake automoc4)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz::https://opendesktop.org/CONTENT/content-files/154766-$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f6332b9ef02b1458cdb234f95516efa7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
