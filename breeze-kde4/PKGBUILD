# Contributor: Antonio Rojas

pkgname=breeze-kde4
pkgver=5.1.0.1
pkgrel=2
pkgdesc='Breeze widget style for KDE4 applications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/breeze'
license=('LGPL')
depends=('kdelibs')
makedepends=('extra-cmake-modules' 'automoc4')
source=("http://download.kde.org/stable/plasma/5.1.0/breeze-$pkgver.tar.xz")
md5sums=('548aa4ac6e1ae8b3ff5756cb15d2ecc4')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../breeze-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_KDE4=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# needed so that pure Qt4 apps are correctly themed
  install -d -m755 "$pkgdir"/usr/lib/qt4/plugins/styles
  ln -sr "$pkgdir"/usr/lib/kde4/plugins/styles/breeze.so "$pkgdir"/usr/lib/qt4/plugins/styles
}
