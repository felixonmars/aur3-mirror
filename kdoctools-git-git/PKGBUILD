# $Id: PKGBUILD 202314 2013-12-21 12:09:59Z andrea $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdoctools-git-git
pkgver=r6.5ec738d
pkgrel=1
pkgdesc='KDocTools'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdoctools-git'
license=('LGPL')
depends=('karchive-git' 'docbook-xsl')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kdoctools-git)
provides=(kdoctools-git)
options=('staticlibs')
source=('git://anongit.kde.org/kdoctools-git.git')
md5sums=('SKIP')

pkgver() {
  cd kdoctools-git
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdoctools-git \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
