# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-platform-12
pkgver=3.1_r03
pkgrel=2
pkgdesc='Android SDK Platform, API-12'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-${pkgver}-linux.zip")
sha1sums=('4a50a6679cd95bb68bb5fc032e754cd7c5e2b1bf')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${pkgver}-linux" "${pkgdir}/opt/android-sdk/platforms/android-12"

  chmod -R ugo+rX "${pkgdir}/opt"
}
