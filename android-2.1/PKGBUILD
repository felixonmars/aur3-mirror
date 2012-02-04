# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname="android-2.1"
pkgver="r03"
pkgrel=1
pkgdesc='Platform for Google Android SDK 2.1'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("http://dl-ssl.google.com/android/repository/${pkgname}_$pkgver-linux.zip")

package() {
  cd "$pkgdir"
  mkdir -p $_platform
   
  mv "$srcdir/${pkgname}_${pkgver}-linux" $pkgdir/$_platform/$pkgname

}
md5sums=('623065030ac3fc4d95193c188c097a67')
