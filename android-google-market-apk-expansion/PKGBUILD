# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-market-apk-expansion
pkgver=r01
pkgrel=1
pkgdesc='Android Market APK Expansion library'
arch=('any')
url="http://developer.android.com/guide/market/expansion-files.html"
license=('custom')
depends=('android-sdk')
source=("https://dl-ssl.google.com/android/repository/market_apk_expansion-r01.zip")
sha1sums=('f658ff74d63da5b438316b6443b98c0d216d041c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/google_market_apk_expansion" "${pkgdir}/opt/android-sdk/extras/google/market_apk_expansion"

  chmod -R ugo+rX "${pkgdir}/opt"
}
