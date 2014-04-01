# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kde4support-git
pkgver=r167.a1cd08f
pkgrel=1
pkgdesc='KDE 4 Support'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kde4support'
license=('LGPL')
depends=('kunitconversion-git' 'kdesignerplugin-git' 'kemoticons-git' 'kitemmodels-git' 'kinit-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools-git' 'qt5-tools')
groups=('kf5')
conflicts=(kde4support)
provides=(kde4support)
source=('git://anongit.kde.org/kde4support.git')
md5sums=('SKIP')

pkgver() {
  cd kde4support
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  export XDG_DATA_DIRS="/opt/kf5/share:$XDG_DATA_DIRS"

  cd build
  cmake ../kde4support \
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
