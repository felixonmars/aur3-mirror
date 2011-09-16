# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=android-1.6
pkgver=r03
pkgrel=1
pkgdesc='Platform for Google Android SDK 1.6'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/android-1.6_r03-linux.zip")

md5sums=('dd599495bc2e69c978e0e7de2c58898e')

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   
  mv "$srcdir/android-1.6_r03-linux" $pkgdir/$_platform/$pkgname

}
