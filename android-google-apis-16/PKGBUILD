# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-16
pkgver=4.1.2_r03
pkgrel=1
pkgdesc='Android Google APIs, API-16'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-16')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-16_r03.zip")
sha1sums=('63467dd32f471e3e81e33e9772c22f33235aa3b3')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-495790-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-16"

  chmod -R ugo+rX "${pkgdir}/opt"
}
