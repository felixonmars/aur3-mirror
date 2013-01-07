# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r04
_ver=4.1.2
_api=16
pkgname=android-platform-${_api}
pkgver=${_ver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API-${_api}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-${_api}_${_rev}.zip")
sha1sums=('90b9157b8b45f966be97e11a22fba4591b96c2ee')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_ver}" "${pkgdir}/opt/android-sdk/platforms/android-${_api}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
