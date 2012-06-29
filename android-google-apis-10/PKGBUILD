# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-10
pkgver=2.3.3_r02
pkgrel=1
pkgdesc='Android Google APIs, API-10'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-10')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-10_r02.zip")
sha1sums=('cc0711857c881fa7534f90cf8cc09b8fe985484d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-10_r02" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-10"

  chmod -R ugo+rX "${pkgdir}/opt"
}
