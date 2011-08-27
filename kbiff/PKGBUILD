# Maintainer: A. Rojas <nqn1976 @ gmail.com>
# Contributor: zmeYski <zmeyski@fastmail.fm>

pkgname=kbiff
pkgver=4.0
pkgrel=1
pkgdesc="A new mail notification utility for the KDE Desktop"
arch=("i686" "x86_64")
url="http://www.kbiff.org/"
depends=("kdelibs")
makedepends=("cmake" "automoc4")
license=("GPL")

source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('e7b8a1dd90f6220046f0a566500aac6769109fb3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}