# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

_rev=r08
_sdkver=4.4.2
_sdkint=19
_build=1488321
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
sha1sums=('dc46b7cbb542a2ea6e6fe5d2c59d4ab9ba3012be'
          '5fc4c2d328a2faa5eda6c65d692903e44805cea9')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  cp -dpr --no-preserve=ownership "${srcdir}/google_apis_x86-${_build}-linux-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis_x86-google-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis_x86-google-${_sdkint}/source.properties"
}
