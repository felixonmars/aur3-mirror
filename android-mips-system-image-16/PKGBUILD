# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_apiver=16
_sdkver=4.1.1
_rel=r02
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
sha1sums=('611c9fe8e6a911587b5ffc45061c0f690a7828a1')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  mv "${srcdir}/mips" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/mips"

  chmod -R ugo+rX "${pkgdir}/opt"
}
