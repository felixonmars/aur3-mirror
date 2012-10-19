# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_apiver=13
_sdkver=3.2
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
source=("http://wpc.1982.edgecastcdn.net/001982/Android/sysimg_mips-${_apiver}_${_rel}.zip")
sha1sums=('c742cbff9c70d3ade833425c0329ee43fa24009b')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  mv "${srcdir}/mips" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/mips"

  chmod -R ugo+rX "${pkgdir}/opt"
}
