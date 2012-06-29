# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-billing
pkgver=r02
pkgrel=1
pkgdesc='Google Play Billing sample code'
replaces=('android-google-market-billing')
arch=('any')
url="http://developer.android.com/guide/google/play/billing"
license=('custom')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/market_billing_${pkgver}.zip" "source.properties")
sha1sums=('3c84c05c60a9cabb578cebce0515860be7ad23d2'
          '637f14979dec024fe485222f74442911e7e693c0')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/market_billing_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/play_billing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/play_billing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
