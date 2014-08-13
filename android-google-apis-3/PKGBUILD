# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_api=3
_ver=1.5
_rev=r03

pkgname=android-google-apis-${_api}
pkgver=${_ver}_${_rev}
pkgrel=2
pkgdesc='Android Google APIs, API-${_api}'
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_api}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-${_api}-${_rev}.zip"
        "source.properties")
sha1sums=('1f92abf3a76be66ae8032257fc7620acbd2b2e3a'
          '8ab700ee0ff1d1d40c308fae29a6cc8b6d9ffead')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-${_api}-${_rev}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
