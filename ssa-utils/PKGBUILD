# Maintainer: Your Name <youremail@domain.com>
pkgname="ssa-utils"
pkgver=0.06
pkgrel=1
pkgdesc="A set of programs to work with .ssa/.ass subtitles"
arch=('i686')
url="https://github.com/AdUser/ssa-utils"
license=('GPL3')
groups=('multimedia')
depends=('gettext')
makedepends=('cmake')
source=("https://github.com/downloads/AdUser/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('dea669413659cca5f1f82c06c6225e89')

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
