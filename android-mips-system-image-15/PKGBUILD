# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_apiver=15
_sdkver=4.0.4
_rel=r01
pkgname=android-mips-system-image-${_apiver}
pkgver=${_sdkver}_${_rel}
pkgrel=3
pkgdesc="Android MIPS System Image, API-${_apiver}"
arch=('any')
url="http://developer.mips.com/android/"
license=('Apache')
depends=("android-platform-15" 'android-sdk>=r21')
options=('!strip')
source=("http://d2a85uzpvoidrc.cloudfront.net/sysimg_mips-${_apiver}_${_rel}.zip")
sha1sums=('a753bb4a6783124dad726c500ce9aec9d2c1b2d9')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  mv "${srcdir}/mips" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/mips"

  chmod -R ugo+rX "${pkgdir}/opt"
}
