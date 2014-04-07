# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kde-runtime
pkgver=4.95.0
pkgrel=3
pkgdesc='Plugins and applications necessary for the running of KDE applications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-runtime'
license=('LGPL')
depends=('qt5-x11extras' 'qt5-svg' 'openexr' 'exiv2' 'smbclient'
         'kcmutils' 'kde4support' 'kemoticons' 'krunner' 'kjsembed'
         'kio' 'knewstuff' 'knotifyconfig' 'kunitconversion'
         'khtml' 'kdesu' 'kdoctools')
makedepends=('extra-cmake-modules' 'openslp' 'kf5umbrella')
groups=('plasma-next')
source=("http://download.kde.org/unstable/plasma/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('1e1530df8e330bed3b80d27424be7550')

prepare() {
  mkdir -p build
}

build() {
  export XDG_DATA_DIRS="/opt/kf5/share:$XDG_DATA_DIRS"

  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
#    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
