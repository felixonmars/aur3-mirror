# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-wolframalpha
pkgver=1.1
pkgrel=1
pkgdesc="A plasmoid frontend for the Wolfram Alpha service"
arch=('any')
url="http://kde-apps.org/content/show.php?content=148951"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/ilpianista/wolframalpha-plasmoid/tarball/${pkgver}")
md5sums=('fb685b426b7010f5cde7caf13efed255')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../ilpianista-wolframalpha-plasmoid-ca58d5f \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
