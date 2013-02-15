# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-billing
pkgver=r04
pkgrel=1
pkgdesc='Google Play Billing sample code'
replaces=('android-google-market-billing')
arch=('any')
url="http://developer.android.com/guide/google/play/billing"
license=('custom')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/play_billing_${pkgver}.zip" "source.properties")
sha1sums=('38fdae51dadb6d1e63e177adba3e4d96b751686e'
          'be1188c8e7542df50e16ce3e827d0b430e390c65')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
#  mv "${srcdir}/play_billing_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/play_billing"
  mv "${srcdir}/play_billing_r03" "${pkgdir}/opt/android-sdk/extras/google/play_billing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/play_billing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
