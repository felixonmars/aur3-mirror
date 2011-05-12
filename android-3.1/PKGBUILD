# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname=android-3.1
pkgver=r01
pkgrel=1
pkgdesc='Platform for Google Android SDK 3.1'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/android-3.1_r01-linux.zip")

md5sums=('2b1e6319f9a672a99df647202e07b9ee')

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   

  mv "$srcdir/android-3.1_r01-linux" $pkgdir/$_platform/android-3.1/

}
