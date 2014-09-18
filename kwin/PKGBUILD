# Contributor: Antonio Rojas

pkgname=kwin
pkgver=5.0.2
pkgrel=1
pkgdesc='KDE Window Manager'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kwin'
license=('LGPL')
depends=('qt5-multimedia' 'plasma-framework' 'kcmutils' 'knewstuff' 'kinit' 'libxcursor')
makedepends=('extra-cmake-modules' 'kdoctools' 'qt5-tools')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('a340f2bc8fca79ac2d4dd07a0c234e77')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DQML_INSTALL_DIR=lib/qt/qml \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DLOCALE_INSTALL_DIR=share/locale/kf5 \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
