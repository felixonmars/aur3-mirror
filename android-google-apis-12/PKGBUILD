# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_api=12
_ver=3.1
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
sha1sums=('e9999f4fa978812174dfeceec0721c793a636e5d'
          '2541f0109d7b72dfb76ff9eb2af7cb9c02ec206f')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-${_api}_${_rev}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
