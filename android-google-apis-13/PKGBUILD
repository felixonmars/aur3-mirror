# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-13
pkgver=3.2_r01
pkgrel=1
pkgdesc='Android Google APIs, API-13'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-13')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-13_r01.zip")
sha1sums=('3b153edd211c27dc736c893c658418a4f9041417')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-13_r01" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-13"

  chmod -R ugo+rX "${pkgdir}/opt"
}
