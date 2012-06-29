# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-11
pkgver=3.0_r02
pkgrel=2
pkgdesc='Android SDK Platform, API-11'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-${pkgver}-linux.zip")
sha1sums=('2c7d4bd13f276e76f6bbd87315fe27aba351dd37')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${pkgver}-linux" "${pkgdir}/opt/android-sdk/platforms/android-11"

  chmod -R ugo+rX "${pkgdir}/opt"
}
