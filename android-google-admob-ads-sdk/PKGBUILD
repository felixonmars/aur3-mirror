# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-admob-ads-sdk
pkgver=6.1.0
pkgrel=1
pkgdesc='Google AdMob Ads SDK'
arch=('any')
url="https://developers.google.com/mobile-ads-sdk"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/googleadmobadssdk/googleadmobadssdkandroid-${pkgver}.zip" "source.properties")
sha1sums=('a24ee6962b237168a8361e07f3b7b80525add8d2'
          'd60c651ef54c20205623b29e2a4ce297c6ab701a')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/GoogleAdMobAdsSdkAndroid-${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/admob_ads_sdk"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/admob_ads_sdk/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
