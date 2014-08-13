# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_api=14
_ver=4.0
_rev=r02
_suffix="229537-mac-x86"

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
sha1sums=('f8eb4d96ad0492b4c0db2d7e4f1a1a3836664d39'
          '700b36ab6bb04316d43de6b05246cf7ad315879d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-${_suffix}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
