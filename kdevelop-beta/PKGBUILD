# $Id: PKGBUILD 145874 2012-01-03 14:26:18Z andrea $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=kdevelop-beta
pkgver=4.2.82
pkgrel=1
pkgdesc="A C/C++ development environment for KDE"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdebase-workspace' 'kdevplatform-beta' 'kdesdk-okteta' 'kdebase-kwrite')
makedepends=('cmake' 'automoc4' 'perl')
provides=kdevelop
conflicts=kdevelop
install="${pkgname}.install"
source=("http://download.kde.org/unstable/${provides}/${pkgver}/src/${provides}-${pkgver}.tar.bz2")
sha1sums=('4fdc96af4a867740fb6656ebd01b09037dfd1dcb')

build() {
  cd "${srcdir}"
  mkdir build
  cd build 
  cmake ../${provides}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
