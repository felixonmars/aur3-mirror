# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=isa-lopensrc
pkgver=2.13
pkgrel=1
pkgdesc="Intel Storage Acceleration Library (Open Source Version)"
url="https://01.org/intel%C2%AE-storage-acceleration-library-open-source-version"
arch=('x86_64' 'i686')
license=('BSD')
depends=('yasm')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://01.org/sites/default/files/downloads/intelr-storage-acceleration-library-open-source-version/${pkgname}${pkgver}.tar.gz"
        "make.inc")
md5sums=('f21ca06fc07857c71d574e59896c58d7'
         'aa401396061e54051cef010696f8d539')

build() {
  cp make.inc "${srcdir}/isa-l_open_src_${pkgver}/"
  cd "${srcdir}/isa-l_open_src_${pkgver}"
  make
}

package() {
  cd "${srcdir}/isa-l_open_src_${pkgver}"
  echo ${pkgdir}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
