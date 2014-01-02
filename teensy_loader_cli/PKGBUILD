# Maintainer: Chris Trotman <chris@trotman.io>
pkgname=teensy_loader_cli
pkgver=2.1
pkgrel=1
pkgdesc="Command line programmer for the teensy devices."
url="http://www.pjrc.com/teensy/loader_cli.html"
arch=('x86_64' 'i686')
license=('GPL3')
depends=("libusb-compat")

source=("http://www.pjrc.com/teensy/${pkgname}.${pkgver}.zip")
md5sums=('c27a8a970f32b60e5bb12b70cb52dd42')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp "teensy_loader_cli" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
