# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-kde-kipi-plugin-git
pkgver=r39.f6a1050
pkgrel=1
pkgdesc="A Kipi Plugin to send images through telepathy"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/network/telepathy/ktp-kipi-plugin"
license=('GPL' 'LGPL')
depends=('telepathy-kde-common-internals' 'libkipi' 'libkdcraw' 'libkexiv2')
makedepends=('cmake' 'automoc4' 'git')
source=('git://anongit.kde.org/ktp-kipi-plugin')
md5sums=('SKIP')

pkgver() {
  cd ktp-kipi-plugin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-kipi-plugin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
