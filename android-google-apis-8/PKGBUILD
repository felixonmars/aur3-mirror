# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-8
pkgver=2.2_r02
pkgrel=1
pkgdesc='Android Google APIs, API-8'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-8')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-8_r02.zip")
sha1sums=('3079958e7ec87222cac1e6b27bc471b27bf2c352')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-8_r02" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-8"

  chmod -R ugo+rX "${pkgdir}/opt"
}
