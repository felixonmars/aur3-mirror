# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=usbdrv
pkgver=1
pkgrel=1
pkgdesc="Tool to attach and detach kernel drivers for USB devices"
arch=('i686' 'x86_64')
url="http://www.clifford.at/"
license=('GPL')
depends=('libusb>=1.0')
source=(http://www.schmoelzer.at/files/$pkgname-$pkgver.tar.xz)
sha256sums=('64727150d9323a394126203d1f967ef93499e99bc59a020881450f5a2a16aecc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin/"
  install -m 755 "${srcdir}/${pkgname}-${pkgver}/usbdrv" \
                 "${pkgdir}/usr/bin/"
}

# vim: set ts=2 sw=2 ft=sh noet:
