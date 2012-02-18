# Maintainer: Iwan Gabovitch <qubodup@gmail.com>

pkgname=android-platform-15
pkgver=4.0.3_r01
pkgrel=1
pkgdesc='Android SDK Platform, API-15'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
source=("http://dl-ssl.google.com/android/repository/android-15_r01.zip")
sha1sums=('f2aa75133c29916b0b0b984974c2d5e46cb09e9c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.0.3" "${pkgdir}/opt/android-sdk/platforms/android-15"
}
