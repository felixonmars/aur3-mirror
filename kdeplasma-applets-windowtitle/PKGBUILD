# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-windowtitle
pkgver=1.1
pkgrel=1
pkgdesc="A QML plasmoid to display the title of the focused window"
arch=('any')
url="https://github.com/ascarpino/windowtitle-plasmoid"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/ascarpino/windowtitle-plasmoid/tarball/${pkgver}")
md5sums=('4a79618c894ab8d8c88da3071622c9f3')

build() {
  mkdir build
  cd build
  cmake ../ascarpino-windowtitle-plasmoid-ccf9f96 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
