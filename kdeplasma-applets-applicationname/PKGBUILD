# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-applicationname
pkgver=2.0
pkgrel=1
pkgdesc="Shows the application name of the focused window"
arch=('any')
url="http://kde-apps.org/content/show.php?content=154324"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
replaces=('kdeplasma-applets-windowtitle')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/ilpianista/applicationname-plasmoid/tarball/${pkgver}")
md5sums=('b5f7195e8022b287b2eb1280820f74d9')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../ilpianista-applicationname-plasmoid-5db45da \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
