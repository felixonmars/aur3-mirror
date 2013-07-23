# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-admob-ads-sdk
pkgver=6.4.1
pkgrel=2
pkgdesc='Google AdMob Ads SDK'
arch=('any')
url="https://developers.google.com/mobile-ads-sdk"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/googleadmobadssdk/googleadmobadssdkandroid-${pkgver}.zip" "source.properties")
sha1sums=('0102859d9575baa0bf4fd5eb422af2ad0fe6cb82'
          '27a108ce9c4c3307876700174011c21969b0b480')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/GoogleAdMobAdsSdkAndroid-${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/admob_ads_sdk"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/admob_ads_sdk/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
