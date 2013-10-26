# Maintainer: Hauptmech <hauptmech[at]gmail[dot]com>
pkgname=rbdl
pkgver=2.1.0
pkgrel=1
_pkghash="70d7265f4d36"
pkgdesc="RBDL - Rigid Body Dynamics Library."
url="http://rbdl.bitbucket.org"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=('cmake' 'eigen3')
conflicts=()
replaces=()
backup=()
install=
source=("https://bitbucket.org/rbdl/rbdl/get/v${pkgver}.zip")
sourcedir="${srcdir}/rbdl-rbdl-${_pkghash}"

build() {
  cd "${srcdir}/rbdl-rbdl-${_pkghash}"
  mkdir -p build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_ADDON_CYSMODEL=ON -DBUILD_ADDON_LUAMODEL=ON
  make
}

package() {
  cd "${srcdir}/rbdl-rbdl-${_pkghash}/build"
  make DESTDIR="${pkgdir}" install
}

md5sums=('9eef1b29b84cbbdf80b05743703c55ea')
