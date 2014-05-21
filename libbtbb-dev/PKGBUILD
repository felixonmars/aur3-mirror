# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=libbtbb-dev
_pkgname=libbtbb
pkgver=2014.02.R1
_pkgver=$(echo ${pkgver} | tr '.' '-')
pkgrel=1
pkgdesc="A library to decode Bluetooth baseband packets, as produced by the Ubertooth and GR-Bluetooth projects."
url="http://sourceforge.net/projects/libbtbb/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('python2')
makedepends=('cmake')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(https://github.com/greatscottgadgets/libbtbb/archive/${_pkgver}.tar.gz
        libbtbb-python2.patch)
md5sums=('0f0d2e0ba9c87e850a9912eb93e36721'
         '46fa10860c489ab266d9c8956736c117')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  patch -p1 -i "${srcdir}/libbtbb-python2.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  mkdir -p build
  pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr"
  make
  popd
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/build"
  make install
}

# vim:set ts=2 sw=2 et:
