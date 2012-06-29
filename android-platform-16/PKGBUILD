# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-16
pkgver=4.1_r01
pkgrel=1
pkgdesc='Android SDK Platform, API-16'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-16_r01.zip")
sha1sums=('168e74676bd1a909508f6e778e553af80b57e623')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.1" "${pkgdir}/opt/android-sdk/platforms/android-16"

  chmod -R ugo+rX "${pkgdir}/opt"
}
