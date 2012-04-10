# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-armv7a-eabi-system-image-15
pkgver=4.0.4_r02
pkgrel=1
pkgdesc='Android ARM EABI v7a System Image, API-15'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
repends=('android-platform-15')
source=("http://dl-ssl.google.com/android/repository/sysimg_armv7a-15_r02.zip")
sha1sums=('1bf977d6cb4e0ad38dceac0c4863d1caa21f326e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-15/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-15/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
