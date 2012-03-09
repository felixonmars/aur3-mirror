# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-14
pkgver=4.0.1_r01
pkgrel=2
pkgdesc='Android SDK Platform, API-14'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
source=("http://dl-ssl.google.com/android/repository/android-14_r01.zip")
sha1sums=('ac8066030953cc4a5a5a83d763b9893a3c7b30d6')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.0.1" "${pkgdir}/opt/android-sdk/platforms/android-14"

  chmod -R ugo+rX "${pkgdir}/opt"
}
