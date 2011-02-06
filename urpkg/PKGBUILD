# Contributor: Sebastien Vasey sebastien dot vasey at gmail dot com

pkgname=urpkg
pkgver=1.9
pkgrel=1
pkgdesc="Install programs in a safe and undoable way"
arch=(i686 x86_64)
url="http://svasey.org/urpkg"
license=('GPL')
depends=()
optdepends=('perl: urpkgize script')
makedepends=('cmake>=2.6')
install="${pkgname}.install"
source=("http://svasey.org/urpkg/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('963e5bf30034ff0511048cbd0c20cef8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DDESTDIR="$pkgdir/" \
      -DCMAKE_INSTALL_PREFIX=/usr -DPKGDIR=/usr/share/urpkg \
      -DCONFIGDIR=/etc/urpkg .. || return 1
  make || return 1
  make install || return 1
}

