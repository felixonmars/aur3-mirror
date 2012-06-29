# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-armv7a-eabi-system-image-14
pkgver=4.0_r02
pkgrel=2
pkgdesc='Android ARM EABI v7a System Image, API-14'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-platform-14')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sysimg_armv7a-14_r02.zip")
sha1sums=('d8991b0c06b18d7d6ed4169d67460ee1add6661b')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-14/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-14/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
