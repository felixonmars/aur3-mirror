# Maintainer: Jakub Schmidtke <david dot roheim-at-gmail-dot-com>

pkgname=android-google-analytics-app-tracking-sdk
pkgver=2.0beta5
pkgrel=2
pkgdesc='Android Analytics App Tracking SDK'
arch=('any')
url="http://code.google.com/mobile/analytics"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("${pkgname}-${pkgver}.zip::http://dl.google.com/gaformobileapps/GoogleAnalyticsAndroid_${pkgver}.zip"
        "source.properties")
sha1sums=('dc14026bf0ce78315cb5dd00552607de0894de83'
          '6359cb95fe4b0f2ad78ab689529a1ceafda52967')

build() {
  true
}

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/GoogleAnalyticsAndroid_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/analytics_sdk_v2"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/analytics_sdk_v2/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
