# $Id: PKGBUILD 144973 2011-12-12 18:32:32Z andrea $
# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=kdevplatform-beta
pkgver=1.2.82
_pkgver=4.2.82
pkgrel=1
pkgdesc="A C/C++ development platform for KDE"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdelibs' 'subversion' 'qjson')
optdepends=("kdesdk-kompare: difference checking")
makedepends=('cmake' 'automoc4' 'boost')
provides=kdevplatform
conflicts=kdevplatform
install=${pkgname}.install
source=("http://download.kde.org/unstable/kdevelop/${_pkgver}/src/${provides}-${pkgver}.tar.bz2")
sha1sums=('7e46b291b5c2abaaf8095974ab3fc7e6654152dc')

build() {
  cd "${srcdir}"/${provides}-${pkgver}

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
