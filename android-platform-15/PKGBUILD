# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Iwan Gabovitch <qubodup@gmail.com>

pkgname=android-platform-15
pkgver=4.0.4_r02
pkgrel=1
pkgdesc='Android SDK Platform, API-15'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
repends=('android-sdk')
source=("http://dl-ssl.google.com/android/repository/android-15_r02.zip")
sha1sums=('7d0cd29d3f91bbb7fb52b87cf04e5afb50376cdc')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-4.0.4" "${pkgdir}/opt/android-sdk/platforms/android-15"

  chmod -R ugo+rX "${pkgdir}/opt"
}
