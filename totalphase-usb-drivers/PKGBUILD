# Maintainer: queue <queueRAM@gmail.com>

# NOTE: Total Phase now requires you to create an account and login before
#       you are allowed to download software.

pkgname=totalphase-usb-drivers
pkgver=2.10
pkgrel=3
pkgdesc="USB Drivers for Total Phase's bus analyzers"
arch=('any')
url="http://www.totalphase.com/products/usb-drivers-linux/"
license=('unknown')
depends=()
options=('!strip')
source=(file://tp-usb-drivers-v${pkgver}.zip)
md5sums=('699a19491aefa9e33c0241291f651cc8')

build() {
  # remove lines that contain "usb_device"
  grep -v "usb_device" ${srcdir}/tp-usb-drivers-v${pkgver}/linux/99-totalphase.rules \
                     > ${srcdir}/tp-usb-drivers-v${pkgver}/linux/99-totalphase.rules.update
}

package() {
  install -Dm644 ${srcdir}/tp-usb-drivers-v${pkgver}/linux/99-totalphase.rules.update ${pkgdir}/usr/lib/udev/rules.d/99-totalphase.rules
}

# vim:set ts=2 sw=2 et:
