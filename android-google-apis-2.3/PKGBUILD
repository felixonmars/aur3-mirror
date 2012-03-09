# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=android-google-apis-2.3
pkgver=r02
pkgrel=2
pkgdesc="API add-on for Google Android SDK 2.3"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis/index.html"
license=('custom')
depends=('android-2.3>=r02')
_sdk=android-sdk
_addon="opt/${_sdk}/add-ons"

source=("http://dl-ssl.google.com/android/repository/google_apis-10_r02.zip")

md5sums=('52993d032b80a6f1425421849f26649a')

package() {
  cd "$pkgdir"
  mkdir -p $_addon
   
  mv "$srcdir/google_apis-10_r02" $pkgdir/$_addon/$pkgname
  chmod -R uog+rX ${pkgdir}/*
}
