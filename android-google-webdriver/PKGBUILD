# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-webdriver
pkgver=r02
pkgrel=1
pkgdesc='Google WebDriver'
arch=('any')
url="http://selenium.googlecode.com"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/webdriver_${pkgver}.zip" "source.properties")
sha1sums=('13f3a3b2670a5fc04a7342861644be9a01b07e38'
          '045823b4ee3725717a69768569fb69951ea5f46d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/WebDriver" "${pkgdir}/opt/android-sdk/extras/google/webdriver"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/webdriver/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
