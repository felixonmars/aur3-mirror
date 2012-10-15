# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-16
pkgver=4.1.2_r03
pkgrel=1
pkgdesc='Android SDK Platform, API-16'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-16_r03.zip")
sha1sums=('80d9ffef58168f9bccd862830e2ee51f686b167e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.1.2" "${pkgdir}/opt/android-sdk/platforms/android-16"

  chmod -R ugo+rX "${pkgdir}/opt"
}
