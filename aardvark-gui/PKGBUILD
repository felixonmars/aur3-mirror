# Maintainer: queue <queueRAM@gmail.com>

# NOTE: Total Phase now requires you to create an account and login before
#       you are allowed to download software.

pkgname=aardvark-gui
pkgver=3.72
pkgrel=1
pkgdesc="Total Phase Aardvark I2C/SPI Control Center Serial Software"
arch=('i686')
url="http://www.totalphase.com"
license=('custom')
depends=('totalphase-usb-drivers')
options=('!strip')
source=(file://control-ctr-serial-linux-i686-v${pkgver}.zip
        ${pkgname}.desktop
        ${pkgname}.sh)
md5sums=('a653af5ae0b6d85e08be57e9ec59f271'
         '4beadbe833d1ab912c9ac7cc69c01f7d'
         'f5fc02d9e15a4f181382b69ce570b814')

_basename="control-ctr-serial-linux-i686"

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -a ${srcdir}/${_basename}-v${pkgver}/{examples,help,images,linux} ${pkgdir}/opt/${pkgname}/
  install -Dm755 ${srcdir}/${_basename}-v${pkgver}/controlctr ${pkgdir}/opt/${pkgname}/controlctr
  install -Dm644 ${srcdir}/${_basename}-v${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licences/${pkgname}/LICENSE.txt
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
}

# vim:set ts=2 sw=2 et:
