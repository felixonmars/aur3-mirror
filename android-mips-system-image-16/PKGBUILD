# Maintainer: Joel Pedraza <pkgs-at-joelpedraza.com>

pkgname=android-mips-system-image-16
pkgver=4.1.1_r01
pkgrel=1
pkgdesc='Android MIPS System Image, API-16'
arch=('any')
url="http://developer.mips.com/android/"
license=('Apache')
depends=('android-platform-16')
options=('!strip')
source=("http://wpc.1982.edgecastcdn.net/001982/Android/sysimg_mips-16_r01.zip")
sha1sums=('4acc50c12dd426029659a2c801659046ad7f29a8')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-16/"
  mv "${srcdir}/mips" "${pkgdir}/opt/android-sdk/system-images/android-16/mips"

  chmod -R ugo+rX "${pkgdir}/opt"
}
