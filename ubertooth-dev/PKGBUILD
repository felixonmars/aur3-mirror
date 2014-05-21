# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=ubertooth-dev
_pkgname=ubertooth
pkgver=2014.02.R1
_pkgver=$(echo ${pkgver} | tr '.' '-')
pkgrel=1
pkgdesc="A 2.4 GHz wireless development board suitable for Bluetooth experimentation. Open source hardware and software. Tools only"
url="http://sourceforge.net/projects/ubertooth/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libbtbb' 'bluez-libs' 'python2')
provides=(${_pkgname})
replaces=(${_pkgname})
source=(https://github.com/greatscottgadgets/ubertooth/archive/${_pkgver}.tar.gz
        ubertooth-python2.patch)
md5sums=('e05e6f3b85b566cfb67350edad211b7a'
         '436638968282670e7309704890d73a32')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  patch -p1 -i "${srcdir}/ubertooth-python2.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/host"
  mkdir -p build
  pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr"
  popd
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/host/build"
  make install
}

# vim:set ts=2 sw=2 et:
