# Contributor: Antonio Rojas

pkgname=oxygen-kde4
pkgver=5.1.0.1
pkgrel=2
pkgdesc='Oxygen widget style for KDE4 applications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/oxygen'
license=('LGPL')
depends=('kdelibs')
makedepends=('extra-cmake-modules' 'automoc4')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/oxygen-$pkgver.tar.xz")
md5sums=('24667744ad797a612d0fe57b2b1d30e0')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../oxygen-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_KDE4=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# needed so that pure Qt4 apps are correctly themed
  install -d -m755 "$pkgdir"/usr/lib/qt4/plugins/styles
  ln -sr "$pkgdir"/usr/lib/kde4/plugins/styles/oxygen.so "$pkgdir"/usr/lib/qt4/plugins/styles
}
