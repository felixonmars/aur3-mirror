# Maintainer: Timothée Ravier <tim@siosm.fr>
# Previous maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-plasma-nm-git
_realname=plasma-nm
pkgver=954.d7535fd
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/network/plasma-nm'
license=('GPL2')
depends=('kdebase-workspace' 'libnm-qt')
makedepends=('cmake' 'automoc4' 'openconnect' 'git')
optdepends=('openconnect')
provides=('kdeplasma-applets-plasma-nm')
conflicts=('kdeplasma-applets-plasma-nm' 'kdeplasma-applets-networkmanagement')
source=('git://anongit.kde.org/plasma-nm.git')
sha256sums=('SKIP')

pkgver() {
  cd ${_realname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_realname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
