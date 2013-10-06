# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Robert Kornmesser <Robert.Kornmesser@gfz-potsdam.de>

pkgname=bluedevil-bluez5-git
_gitname=bluedevil
pkgver=v1.3.2.25.g3fda0b1
pkgrel=1
pkgdesc='KDE bluetooth framework for bluez5 - Git version'
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/base/bluedevil"
license=('GPL')
depends=('kdebase-workspace' 'libbluedevil-bluez5-git' 'obex-data-server')
makedepends=('cmake' 'automoc4' 'git')
provides=('bluedevil')
conflicts=('bluedevil')
source=('git://anongit.kde.org/bluedevil.git#branch=bluez5')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${_gitname}"
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}
