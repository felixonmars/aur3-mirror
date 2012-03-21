# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgbase=libftdi
pkgname=lib32-${_pkgbase}
pkgver=0.20
pkgrel=1
pkgdesc="A library to talk to FTDI chips (32-bit)"
arch=('i686' 'x86_64')
url="http://www.intra2net.com/en/developer/libftdi/download.php"
license=('GPL2' 'LGPL2.1')
depends=('lib32-libusb-compat' 'lib32-gcc-libs' ${_pkgbase})
makedepends=('boost' 'gcc-multilib')
options=('!libtool')
source=("http://www.intra2net.com/en/developer/libftdi/download/${_pkgbase}-${pkgver}.tar.gz")
sha1sums=('4bc6ce70c98a170ada303fbd00b8428d8a2c1aa2')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  sed -i '/no-install/d' examples/Makefile.in
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include}
}
