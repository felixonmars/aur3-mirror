# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-14
pkgver=4.0.2_r03
pkgrel=1
pkgdesc='Android SDK Platform, API-14'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-14_r03.zip")
sha1sums=('41ba83b51e886461628c41b1b4d47762e0688ed5')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.0.2" "${pkgdir}/opt/android-sdk/platforms/android-14"

  chmod -R ugo+rX "${pkgdir}/opt"
}
