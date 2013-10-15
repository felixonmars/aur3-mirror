# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-billing
pkgver=r05
pkgrel=1
pkgdesc='Google Play Billing sample code'
replaces=('android-google-market-billing')
arch=('any')
url="http://developer.android.com/guide/google/play/billing"
license=('custom')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/play_billing_${pkgver}.zip" "source.properties")
sha1sums=('bd2ac5ce7127070ac3229003eb69cfb806628ac9'
          'ec80625c589ca1a7da573e151cfc1dce8cb4d58c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
#  mv "${srcdir}/play_billing_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/play_billing"
  mv "${srcdir}/play_billing" "${pkgdir}/opt/android-sdk/extras/google/play_billing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/play_billing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
