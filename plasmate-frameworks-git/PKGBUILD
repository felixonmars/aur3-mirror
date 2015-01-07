# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgname=plasmate-frameworks-git
pkgver=r1304.e22584a
pkgrel=1
pkgdesc='A small IDE taylored for development of Plasma components, such as Widgets, Runners, Dataengines.'
arch=('i686' 'x86_64')
url='https://projects.kde.org/plasmate'
license=('LGPL')
depends=('plasma-workspace' 'kdevplatform-git') # 'prison-git'
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
optdepends=('plasma-workspace-wallpapers: additional wallpapers')
options=()
source=('git://anongit.kde.org/plasmate.git#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd plasmate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasmate \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Debug \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
