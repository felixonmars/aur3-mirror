# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-15
pkgver=4.0.4_r02
pkgrel=1
pkgdesc='Android Google APIs, API-15'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-15')
source=("http://dl-ssl.google.com/android/repository/google_apis-15_r02.zip")
sha1sums=('6757c12788da0ea00c2ab58e54cb438b9f2bcf66')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-302030-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-15"

  chmod -R ugo+rX "${pkgdir}/opt"
}
