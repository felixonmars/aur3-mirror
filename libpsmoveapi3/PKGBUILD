# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=libpsmoveapi3
pkgver=3.0.0
pkgrel=1
pkgdesc="Playstation Move Motion Controller API - Core library"
arch=(i686 x86_64)
license=(GPL)
depends=("libbluetooth3>=4.91" "glibc>=2.7")
url=(https://launchpad.net/~thp/+archive/psmoveapi/+packages)


if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha256sums=(ac8a23c1a07dceb0f04c5502c88147a6b29c6443ef6cd025e229db5de4b24b9f)
else
  _debarch=amd64
  sha256sums=(85fdec410465dcb0a7bdb29c1c68f07c7e9eb979ae7819498e6c3a648194f34c)
fi

source=(https://launchpad.net/~thp/+archive/psmoveapi/+files/${pkgname}_${pkgver}%7Eppa0_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 et:
