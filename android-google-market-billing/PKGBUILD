# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-market-billing
pkgver=r01
pkgrel=1
pkgdesc='Android Market Billing sample code'
arch=('any')
url="http://developer.android.com/guide/market/billing"
license=('custom')
depends=('android-sdk')
source=("https://dl-ssl.google.com/android/repository/market_billing_${pkgver}.zip" "source.properties")
sha1sums=('dfec951fe988a55de7622ed87a4dd57fe60f4865' '7b7512f39cdc20c1857bed73c99f2b0d29a410a6')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/market_billing_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/market_billing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/market_billing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
