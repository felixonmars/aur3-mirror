# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=klock
pkgver=0.1.0
pkgrel=1
pkgdesc="A small X display lock program."
url="https://github.com/KokaKiwi/klock"
license=('GPL')
source=('git://github.com/KokaKiwi/klock.git')
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('libx11')

prepare() {
  cd "${srcdir}/${pkgname}"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${srcdir}/${pkgname}/build"

  make
}

package() {
  cd "${srcdir}/${pkgname}/build"

  make DESTDIR="$pkgdir" install
}
