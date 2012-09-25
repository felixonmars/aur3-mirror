# Maintainer: Joel Pedraza <pkgs-at-joelpedraza.com>

pkgname=android-mips-system-image-15
pkgver=4.0.4_r01
pkgrel=2
pkgdesc='Android MIPS System Image, API-15'
arch=('any')
url="http://developer.mips.com/android/"
license=('Apache')
depends=('android-platform-15' 'android-sdk>=21')
options=('!strip')
source=("http://wpc.1982.edgecastcdn.net/001982/Android/sysimg_mips-15_r01.zip")
sha1sums=('a753bb4a6783124dad726c500ce9aec9d2c1b2d9')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-15/"
  mv "${srcdir}/mips" "${pkgdir}/opt/android-sdk/system-images/android-15/mips"

  chmod -R ugo+rX "${pkgdir}/opt"
}
