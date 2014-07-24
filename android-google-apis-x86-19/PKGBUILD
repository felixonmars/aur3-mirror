# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

_rev=r06
_sdkver=4.4
_sdkint=19
pkgname=android-google-apis-x86-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, API-${_sdkint} (x86 System Image)"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=(
	"https://dl-ssl.google.com/android/repository/sys-img/x86/google_apis_x86-${_sdkint}_${_rev}.zip"
	"source.properties")
sha1sums=('2bf375d6448af70038e611bad4a5585305d5da66'
          '5776a97fd64499032fd88f8be979938584e82b5d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  cp -dpr --no-preserve=ownership "${srcdir}/google_apis_x86-1246540-linux-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis_x86-google-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis_x86-google-${_sdkint}/source.properties"
}
