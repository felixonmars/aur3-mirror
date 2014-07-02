# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=psmoveapi-utils
pkgver=3.0.0
pkgrel=1
pkgdesc="Playstation Move Motion Controller API - Utilities"
arch=(i686 x86_64)
license=(GPL)
depends=("libpsmoveapi3=3.0.0" "libbluetooth3>=4.91" "glibc>=2.15")
url=(https://launchpad.net/~thp/+archive/psmoveapi/+packages)


if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha256sums=(b4b620a14ecd58f3095fe8c12cb7505dc051c3aea8c13e76b737a244476addda)
else
  _debarch=amd64
  sha256sums=(0f3f14e40e61ecc45fd3e24918013168283430b99e4c0824aebdff732e077efa)
fi

source=(https://launchpad.net/~thp/+archive/psmoveapi/+files/${pkgname}_${pkgver}%7Eppa0_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 et:
