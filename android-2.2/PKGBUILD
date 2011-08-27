# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname=android-2.2
pkgver=r02
pkgrel=1
pkgdesc='Platform for Google Android SDK 2.2'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/android-2.2_$pkgver-linux.zip")

md5sums=('d11d4b3be48648ff68db05a75f26155d')

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   
  mv "$srcdir/android-2.2_r02-linux" $pkgdir/$_platform/$pkgname

}
