# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r03
_sdkver=4.3
_sdkint=18
pkgname=android-google-apis-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=2
pkgdesc="Android Google APIs, API-${_sdkint}"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=(
	"http://dl.google.com/android/repository/google_apis-${_sdkint}_${_rev}.zip"
	"source.properties")
sha1sums=(
	'147bce09c1163edc17194f3db496ec1086fcf965'
	'b15c0d8c84230bd9238bf35f8aced52aefffcc49')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-836888-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
