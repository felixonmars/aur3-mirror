# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-16
pkgver=4.1.1_r02
pkgrel=1
pkgdesc='Android SDK Platform, API-16'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-16_r02.zip")
sha1sums=('f9609569962f93a1eeab55c7faf0da0a375249d7')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.1.1" "${pkgdir}/opt/android-sdk/platforms/android-16"

  chmod -R ugo+rX "${pkgdir}/opt"
}
