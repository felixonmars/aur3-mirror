# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-analytics-sdk
pkgver=1.4.2
pkgrel=1
pkgdesc='Android Analytics SDK'
arch=('any')
url="http://code.google.com/mobile/analytics"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl.google.com/gaformobileapps/GoogleAnalyticsAndroid_${pkgver}.zip" "source.properties")
sha1sums=('328bcdc6c241879ebb04d6edc6fec1052a171004' '2cd6828359f9240b7de3d7abf745a111ecc4a587')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/GoogleAnalytics" "${pkgdir}/opt/android-sdk/extras/google/analytics_sdk"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/analytics_sdk/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
