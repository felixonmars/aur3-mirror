# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_api=15
_ver=4.0.4
_rev=r02
_suffix="302030-mac-x86"

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
sha1sums=('6757c12788da0ea00c2ab58e54cb438b9f2bcf66'
          'c26158df289aa8126f95ea068fc8970506b714f6')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-${_suffix}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_api}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
