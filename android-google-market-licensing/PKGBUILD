# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-market-licensing
pkgver=r02
pkgrel=1
pkgdesc='Android Market Licensing client library'
arch=('any')
url="http://developer.android.com/guide/market/licensing"
license=('custom')
depends=('android-sdk')
source=("https://dl-ssl.google.com/android/repository/market_licensing-${pkgver}.zip" "source.properties")
sha1sums=('355e8dc304a92a5616db235af8ee7bd554356254' '3cda6150949ad72a240a3475694aa1bc6d400c60')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/google_market_licensing" "${pkgdir}/opt/android-sdk/extras/google/market_licensing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/market_licensing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
