# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_api=4
_ver=1.6
_rev=r02

pkgname=android-google-apis-${_api}
pkgver=${_ver}_${_rev}
pkgrel=2
pkgdesc='Android Google APIs, API-${_api}'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_api}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-${_api}_${_rev}.zip"
        "source.properties")
sha1sums=('9b6e86d8568558de4d606a7debc4f6049608dbd0'
          'df2cbea1afb14c24c9d58e6a51f86628c514d722')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-${_api}_${_rev}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
