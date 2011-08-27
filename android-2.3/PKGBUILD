# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname=android-2.3
pkgver=r01
pkgrel=1
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/android-2.3.3_r01-linux.zip")

md5sums=('29216ec75126560b90f8768a6cdc49fe')

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   
  mv "$srcdir/android-2.3.3_r01-linux" $pkgdir/$_platform/$pkgname

}
