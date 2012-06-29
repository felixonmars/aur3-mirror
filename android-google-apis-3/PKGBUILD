# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-3
pkgver=1.5_r03
pkgrel=1
pkgdesc='Android Google APIs, API-3'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-3')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-3-r03.zip")
sha1sums=('1f92abf3a76be66ae8032257fc7620acbd2b2e3a')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-3-r03" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-3"

  chmod -R ugo+rX "${pkgdir}/opt"
}
