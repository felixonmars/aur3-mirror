# Maintainer: Amr Hassan <amr.hassan@gmail.com>
pkgname=libsxml
pkgver=0.2.4
pkgrel=1
pkgdesc="Simple XML Parser and DOM API for C++"
url="https://bitbucket.org/amrhassan/libsxml"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=(utf8cpp)
source=("https://bitbucket.org/amrhassan/libsxml/get/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/amrhassan-${pkgname}-${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/amrhassan-${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

md5sums=('1f10b97a923f9829dd9f7ca7daad4bb5')
