# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname=android-3.1
pkgver=r02
pkgrel=1
pkgdesc='Platform for Google Android SDK 3.1'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/android-3.1_r02-linux.zip")

md5sums=('162f997fe7c39e6aadc464f958c7debe')

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   

  mv "$srcdir/android-3.1_r02-linux" $pkgdir/$_platform/android-3.1/

}
