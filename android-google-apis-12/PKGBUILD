# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-12
pkgver=3.1_r01
pkgrel=1
pkgdesc='Android Google APIs, API-12'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-12')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-12_r01.zip")
sha1sums=('e9999f4fa978812174dfeceec0721c793a636e5d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-12_r01" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-12"

  chmod -R ugo+rX "${pkgdir}/opt"
}
