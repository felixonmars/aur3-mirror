# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=aardvark-gui
pkgver=3.53
pkgrel=1
pkgdesc="Aardvark GUI Control Center"
arch=('i686')
url="http://www.totalphase.com"
license=('custom')
depends=('totalphase-usb-drivers')
options=('!strip')
source=(http://www.totalphase.com/download/zip/${pkgname}-linux-v${pkgver}.zip
        ${pkgname}.desktop
        ${pkgname}.sh)
md5sums=('ee677b31daf1ad386b99f515838e2eb6'
         '6d2de832c1ec3d03346862564bf1c134'
         'f5fc02d9e15a4f181382b69ce570b814')

build() {
  return 0
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-linux-v${pkgver}/{aardvark,examples,help,images,linux} ${pkgdir}/opt/${pkgname}/
  install -m 644 -D ${srcdir}/${pkgname}-linux-v${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licences/${pkgname}/LICENSE.txt
  install -m 644 -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m 755 -D ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
}

# vim:set ts=2 sw=2 et:
