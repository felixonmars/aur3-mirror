# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-10
pkgver=2.3.3_r02
pkgrel=2
pkgdesc='Android SDK Platform, API-10'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-${pkgver}-linux.zip")
sha1sums=('887e37783ec32f541ea33c2c649dda648e8e6fb3')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${pkgver}-linux" "${pkgdir}/opt/android-sdk/platforms/android-10"

  chmod -R ugo+rX "${pkgdir}/opt"
}
