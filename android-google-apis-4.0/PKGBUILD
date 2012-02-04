# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=android-google-apis-4.0
pkgver=r01
pkgrel=1
pkgdesc="API add-on for Google Android SDK 4.0"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis/index.html"
license=('custom')
depends=('android-4.0>=r01')
_sdk=android-sdk
_addon="opt/${_sdk}/add-ons"

source=("http://dl-ssl.google.com/android/repository/google_apis-14_r01.zip")

md5sums=('06b84b2b06eed28af088bf055487a2ff')

package() {
  cd "$pkgdir"
  mkdir -p $_addon
   
  mv "$srcdir/google_apis-202595-mac-x86" $pkgdir/$_addon/$pkgname

}
