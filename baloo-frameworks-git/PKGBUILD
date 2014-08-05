# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=baloo-frameworks-git
pkgver=r1205.8c94c31
pkgrel=1
pkgdesc="A framework for searching and managing metadata"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdelibs/baloo'
license=('LGPL')
depends=('xapian-core' 'kfilemetadata-git' 'kidletime-git' 'kcmutils-git' 'kdelibs4support-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
provides=('baloo-frameworks' 'baloo-frameworks-git')
conflicts=('baloo-frameworks' 'baloo-frameworks-git')
replaces=('baloo-frameworks-git')
source=('git://anongit.kde.org/baloo.git')
md5sums=('SKIP')

pkgver() {
  cd baloo
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../baloo \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DQT_PLUGIN_INSTALL_DIR=lib/qt/plugins
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

# remove conflicting policy file
  rm -fr "$pkgdir"/usr
}
