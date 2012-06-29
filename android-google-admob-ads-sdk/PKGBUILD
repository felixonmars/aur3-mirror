# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-admob-ads-sdk
pkgver=6.0.1
pkgrel=1
pkgdesc='Google AdMob Ads SDK'
arch=('any')
url="https://developers.google.com/mobile-ads-sdk"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/googleadmobadssdk/googleadmobadssdkandroid-${pkgver}.zip" "source.properties")
sha1sums=('116994e4c130ea72ccef3b803b8ee7414aa848a2'
          '13110efa7b81a06c826901214514cc401a8bb6e1')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/GoogleAdMobAdsSdkAndroid-${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/admob_ads_sdk"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/admob_ads_sdk/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
