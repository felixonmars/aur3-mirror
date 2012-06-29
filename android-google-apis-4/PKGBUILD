# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-4
pkgver=1.6_r02
pkgrel=1
pkgdesc='Android Google APIs, API-4'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-4')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-4_r02.zip")
sha1sums=('9b6e86d8568558de4d606a7debc4f6049608dbd0')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-4_r02" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-4"

  chmod -R ugo+rX "${pkgdir}/opt"
}
