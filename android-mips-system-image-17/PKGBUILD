# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_apiver=17
_sdkver=4.2.1
_rel=r01
pkgname=android-mips-system-image-${_apiver}
pkgver=${_sdkver}_${_rel}
pkgrel=1
pkgdesc="Android MIPS System Image, API-${_apiver}"
arch=('any')
url="http://developer.mips.com/android/"
license=('Apache')
depends=("android-platform-${_apiver}" 'android-sdk>=r21')
options=('!strip')
source=("http://d2a85uzpvoidrc.cloudfront.net/sysimg_mips-${_apiver}_${_rel}.zip")
sha1sums=('f0c6e153bd584c29e51b5c9723cfbf30f996a05d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  mv "${srcdir}/mips" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/mips"

  chmod -R ugo+rX "${pkgdir}/opt"
}
