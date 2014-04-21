# Maintainer: korjjj <korjjj@gmail.com>
# Contributor: Tarjaizaid <tarjaizaid@gmail.com>

pkgname=dynamips-community
pkgver=0.2.12
pkgrel=1
pkgdesc="Cisco router emulator. Community version maintained by GNS3 team."
arch=('i686' 'x86_64')
url="http://www.gns3.net/dynamips"
license=('GPL2')
depends=(libpcap util-linux elfutils)
conflicts=(dynamips dynamips-community-git)
source=("https://github.com/GNS3/dynamips/archive/v${pkgver}.tar.gz")
md5sums=('b4ac82b838787ca61e636afbc35e3a2e')

build() {
  if test "$CARCH" == x86_64; then
    export DYNAMIPS_ARCH=amd64
  fi
  cd ${srcdir}/dynamips-${pkgver}
  make
}

package() {
  cd ${srcdir}/dynamips-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
