# Maintaner: Joel Pedraza <joel@joelpedraza.com>

_rev=r02
_sdkver=5.0
_sdkint=21
pkgname=android-google-apis-x86_64-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, API-${_sdkint} (x86_64 System Image)"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=(
	"http://dl.google.com/android/repository/sys-img/google_apis/sysimg_x86_64-${_sdkint}_${_rev}.zip"
	"source.properties")
sha1sums=('b8117ebeae1a9eddfe19cbb30a853dbc713ec1b6'
          '6bd3e8ddd176957229480d9168d36bbd97982d38')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis"
  cp -dpr --no-preserve=ownership "${srcdir}/x86_64" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/x86_64"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -m644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/google_apis/x86_64/source.properties"
}
