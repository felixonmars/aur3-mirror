# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-7
pkgver=2.1_r01
pkgrel=1
pkgdesc='Android Google APIs, API-7'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-7')
source=("http://dl-ssl.google.com/android/repository/google_apis-7_r01.zip")
sha1sums=('2e7f91e0fe34fef7f58aeced973c6ae52361b5ac')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-7_r01" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-7"

  chmod -R ugo+rX "${pkgdir}/opt"
}
