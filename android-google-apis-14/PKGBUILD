# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-apis-14
pkgver=4.0_r02
pkgrel=1
pkgdesc='Android Google APIs, API-14'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=('android-platform-14')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-14_r02.zip")
sha1sums=('f8eb4d96ad0492b4c0db2d7e4f1a1a3836664d39')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-229537-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-14"

  chmod -R ugo+rX "${pkgdir}/opt"
}
