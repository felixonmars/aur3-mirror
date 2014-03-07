# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

_rev=r02
_sdkver=4.4
_sdkint=19
pkgname=android-google-apis-x86-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=2
pkgdesc="Android Google APIs, API-${_sdkint} (x86 System Image)"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=(
	"https://dl-ssl.google.com/android/repository/sys-img/x86/google_apis_x86-${_sdkint}_${_rev}.zip"
	"source.properties")
sha1sums=(
	'0fb71d18800064c96a5645166e2ae666275a1e59'
	'ec6ce928947882a93040c156cb556fa395b06e52')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis_x86-999428-linux-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis_x86-google-${_sdkint}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis_x86-google-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
