# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-market-billing
pkgver=r02
pkgrel=1
pkgdesc='Android Market Billing sample code'
arch=('any')
url="http://developer.android.com/guide/market/billing"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/market_billing_${pkgver}.zip" "source.properties")
sha1sums=('3c84c05c60a9cabb578cebce0515860be7ad23d2'
          '0f17b0383e8f1d9e30cf391ffabb3c488e5059de')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/market_billing_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/market_billing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/market_billing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
