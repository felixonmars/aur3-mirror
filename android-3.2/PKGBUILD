# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname=android-3.2
pkgver=r01
pkgrel=1
pkgdesc='Platform for Google Android SDK 3.2'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/android-3.2_r01-linux.zip")

md5sums=('56a8afb13988a2f98e53d1df75f2c004')

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   

  mv "$srcdir/android-3.2_r01-linux" $pkgdir/$_platform/android-3.2/

}
