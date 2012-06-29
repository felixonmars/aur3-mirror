# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-11
pkgver=3.0_r01
pkgrel=1
pkgdesc='Android Google APIs, API-11'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-11')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-11_r01.zip")
sha1sums=('5eab5e81addee9f3576d456d205208314b5146a5')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-11_r01" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-11"

  chmod -R ugo+rX "${pkgdir}/opt"
}
