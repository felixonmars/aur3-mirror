# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_apiver=16
_sdkver=4.1.2
_rel=r04
pkgname=android-mips-system-image-${_apiver}
pkgver=${_sdkver}_${_rel}
pkgrel=2
pkgdesc="Android MIPS System Image, API-${_apiver}"
arch=('any')
url="http://developer.mips.com/android/"
license=('Apache')
depends=("android-platform-${_apiver}" 'android-sdk>=r21')
options=('!strip')
source=("http://d2a85uzpvoidrc.cloudfront.net/sysimg_mips-${_apiver}_${_rel}.zip"
        "source.properties")
sha1sums=('67943c54fb3943943ffeb05fdd39c0b753681f6e'
          'ef7c784902797c24050199aeb709066c832f28a0')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  cp -r "${srcdir}/mips" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/mips"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/mips"
  chmod -R ugo+rX "${pkgdir}/opt"
}
