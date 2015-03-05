# Maintainer: Gustavo Castro << gustawho [at] gmail [dot] com >>
pkgname=sushi4physics-hb
_srcname=SusHi
pkgver=1.4.1
pkgrel=2
pkgdesc="Higgs production in the MSSM (HiggsBounds support)"
url="http://sushi.hepforge.org/"
arch=('x86_64')
license=('GPLv2')
depends=('lhapdf' 'higgsbounds')
makedepends=('gcc-fortran')
provides=('sushi4physics')
conflicts=('sushi4physics-2hdmc' 'sushi4physics-fh' 'sushi4physics')
source=("http://www.hepforge.org/archive/sushi/${_srcname}-${pkgver}.tar.gz"
        "higgsbounds.patch")
sha512sums=('3033c35551fc6ba50afef00cf7facccbae7c82b63f90df293167e7318e35576ef6033b94b68ce6330d43b4c61416e5d5589a118c6b7389cf2ba96c0148e0c5ff'
            'b571046917a1605d5cc41646c1fd20282bd9cb97b6a82b2c138436a4426cb7625c6293c299826ef4688680176fc1d54a035a7baeaddf7ad329289894fae86892')

build() {
  patch "${srcdir}/${_srcname}-${pkgver}/Makefile" < "${srcdir}/higgsbounds.patch"
  cd "${srcdir}/${_srcname}-${pkgver}"
  ./configure --prefix=/usr
  make predef=HB
}

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  cd "${srcdir}/${_srcname}-${pkgver}"
  install -m755 bin/sushi.HB "${pkgdir}/usr/bin/sushi.HB"
  install -m755 lib/libshare.a "${pkgdir}/usr/lib/libshare.a"
  install -m755 lib/libsushiHB.a "${pkgdir}/usr/lib/libsushiHB.a"
  ln -s "${pkgdir}/usr/bin/sushi.HB" "${pkgdir}/usr/bin/sushi"
  ln -s "${pkgdir}/usr/lib/libsushiHB.a" "${pkgdir}/usr/lib/libsushi.a"
}

# vim:set ts=2 sw=2 et:
