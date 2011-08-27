# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname=android-3.0
pkgver=r01
pkgrel=1
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/android-3.0_r01-linux.zip")

md5sums=('5d3efc5a09f5779c1e58ac98bb54c522')

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   

  mv "$srcdir/android-3.0_r01-linux" $pkgdir/$_platform/android-3.0/

}
