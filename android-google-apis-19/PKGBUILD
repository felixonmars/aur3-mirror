# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r03
_sdkver=4.4
_sdkint=19
pkgname=android-google-apis-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, API-${_sdkint}"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/google_apis-${_sdkint}_${_rev}.zip")
sha1sums=('f3649d9f9aaa38d2a1928b943ba523346fe20645')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-1019911-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
