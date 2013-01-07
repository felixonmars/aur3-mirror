# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-billing
pkgver=r03
pkgrel=1
pkgdesc='Google Play Billing sample code'
replaces=('android-google-market-billing')
arch=('any')
url="http://developer.android.com/guide/google/play/billing"
license=('custom')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/play_billing_${pkgver}.zip" "source.properties")
sha1sums=('a133d454c992ef2a18e62fa810e8185f1be4b054'
          'a77be9af61179f0acb740792d80ebd1694f36a6e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/play_billing_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/play_billing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/play_billing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
