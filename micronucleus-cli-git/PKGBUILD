# Maintainer: Adis Hamzić <adis (at) hamzadis (dot) com>
_pkgname=micronucleus-cli
pkgname=${_pkgname}-git
pkgver=20140119
pkgrel=1
pkgdesc="AtTiny85 usb bootloader with a strong emphasis on bootloader compactness."
arch=('i686' 'x86_64')
url="https://github.com/micronucleus/micronucleus"
license=('GPL')
depends=('libusb-compat')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('git+https://github.com/micronucleus/micronucleus')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/micronucleus"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd "${srcdir}/micronucleus"

  cd commandline
  make
}

package() {
  cd "${srcdir}/micronucleus"

  mkdir -p "${pkgdir}/usr/bin"
  cp "commandline/micronucleus" "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/etc/udev/rules.d"
  cp "commandline/49-micronucleus.rules" "${pkgdir}/etc/udev/rules.d/"

  install -D -m644 "License.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

