# Maintainer: queue <queueRAM@gmail.com>

# NOTE: Total Phase now requires you to create an account and login before
#       you are allowed to download software.

pkgname=beagle-data-center
pkgver=6.61
pkgrel=1
pkgdesc="Total Phase Beagle Data Center GUI"
arch=('i686' 'x86_64')
url="http://www.totalphase.com/products/data-center/"
license=('custom')
depends=('gtk2' 'phonon' 'qtwebkit' 'totalphase-usb-drivers')
options=('!strip')
source=(file://data-center-linux-${CARCH}-v${pkgver}.zip
        ${pkgname}.desktop
        ${pkgname}.sh)

md5sums=('e440c2b57018d99919a41ab4df95c022'
         'ed474b724c0310e3f83a1ec420b9c31e'
         '5f5c031334b147bb28706e391de457cb')

[ "$CARCH" = "x86_64" ] && \
md5sums=('b3d2ce360c4f9211d4def701e30f5689'
         'ed474b724c0310e3f83a1ec420b9c31e'
         '5f5c031334b147bb28706e391de457cb')

package() {
  mkdir -p ${pkgdir}/usr/share/${pkgname}/bin
  cp -a ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/doc ${pkgdir}/usr/share/${pkgname}/
  cp -a ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/i18n ${pkgdir}/usr/share/${pkgname}/
  cp -a ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/example ${pkgdir}/usr/share/${pkgname}/
  install -Dm755 ${srcdir}/beagle-data-center.sh ${pkgdir}/usr/bin/beagle-data-center
  install -Dm644 ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  # this is a bad place to put these, but the data center seems to only search relative paths for them
  install -Dm755 ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/Data\ Center ${pkgdir}/usr/share/${pkgname}/Data\ Center
  install -Dm644 ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/lib/libruntime.so ${pkgdir}/usr/share/${pkgname}/lib/libruntime.so
  install -Dm755 ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/bin/kmflash ${pkgdir}/usr/share/${pkgname}/bin/kmflash
  cp -a ${srcdir}/data-center-linux-${CARCH}-v${pkgver}/bin/Beagle\ 5000\ Update\ Utility ${pkgdir}/usr/share/${pkgname}/bin/
}

# vim:set ts=2 sw=2 et:
