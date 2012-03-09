# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-15
pkgver=4.0.3_r01
pkgrel=1
pkgdesc='Android Google APIs, API-15'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-platform-15')
source=("http://dl-ssl.google.com/android/repository/google_apis-15_r01.zip")
sha1sums=('0339e3d919918d32750c77101a3b04b4cd64e549')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-237985-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-15"

  chmod -R ugo+rX "${pkgdir}/opt"
}
