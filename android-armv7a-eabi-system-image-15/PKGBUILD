# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-armv7a-eabi-system-image-15
pkgver=4.0.3_r01
pkgrel=1
pkgdesc='Android ARM EABI v7a System Image, API-15'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
repends=('android-platform-15')
source=("http://dl-ssl.google.com/android/repository/sysimg_armv7a-15_r01.zip")
sha1sums=('d7b094803c1dc2f0b3ab8e153058cfbecc198df7')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-15/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-15/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
