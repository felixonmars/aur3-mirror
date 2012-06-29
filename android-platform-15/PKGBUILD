# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Iwan Gabovitch <qubodup@gmail.com>

pkgname=android-platform-15
pkgver=4.0.4_r03
pkgrel=1
pkgdesc='Android SDK Platform, API-15'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-15_r03.zip")
sha1sums=('23da24610a8da51054c5391001c51ce43a778b97')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.0.4" "${pkgdir}/opt/android-sdk/platforms/android-15"

  chmod -R ugo+rX "${pkgdir}/opt"
}
