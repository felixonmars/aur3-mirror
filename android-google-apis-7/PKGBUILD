# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_api=7
_ver=2.1
_rev=r01

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
sha1sums=('2e7f91e0fe34fef7f58aeced973c6ae52361b5ac'
          'afa3c73061971f191b482835bfc4d6def23d9879')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-${_api}_${_rev}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
