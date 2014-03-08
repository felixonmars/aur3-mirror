# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kfileaudiopreview-git
pkgver=r10.820f744
pkgrel=1
pkgdesc='KFile Audio Preview'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kfileaudiopreview'
license=('LGPL')
depends=('kio-git')
makedepends=('extra-cmake-modules' 'git')
groups=('kf5')
conflicts=(kfileaudiopreview)
provides=(kfileaudiopreview)
source=('git://anongit.kde.org/kfileaudiopreview.git')
md5sums=('SKIP')

pkgver() {
  cd kfileaudiopreview
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kfileaudiopreview \
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
