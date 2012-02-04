# Maintainer: Demiurgous <demiurgous@gmail.com>

pkgname="android-compatibility-package"
pkgver="r03"
pkgrel=1
pkgdesc='Compatibility libraries for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/compatibility-library.html"
license=('custom')
depends=('android-sdk')
_sdk=android-sdk
_android_extras="opt/${_sdk}/extras/android"

source=("http://dl-ssl.google.com/android/repository/compatibility_$pkgver.zip")

package() {
  cd "$pkgdir"
  mkdir -p $_android_extras
   
  mv "$srcdir/compatibility" "$pkgdir/$_android_extras"

}
sha1sums=('49e32c0aca8e52c2e9a398912a68c036583b917f')
