# Maintainer: Georges Discry <georges at discry dot be>

pkgname=mali-udev
pkgver=1
pkgrel=1
pkgdesc="Udev rules to allow access of the Mali hardware to the video group"
arch=('any')
url="http://linux-sunxi.org/Binary_drivers"
license=('custom')
source=('50-mali.rules')
md5sums=('e58fbb1d5c6a7730003eecba7d8f174a')

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/50-mali.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
