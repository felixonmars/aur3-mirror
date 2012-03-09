# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=android-google-apis-1.6
pkgver=r02
pkgrel=2
pkgdesc="API add-on for Google Android SDK 1.6"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis/index.html"
license=('custom')
depends=('android-1.6>=r03')
_sdk=android-sdk
_addon="opt/${_sdk}/add-ons"

source=("http://dl-ssl.google.com/android/repository/google_apis-4_r02.zip")

md5sums=('45cfcc55dc29aaf549464786735f7d94')

package() {
  cd "$pkgdir"
  mkdir -p $_addon
   
  mv "$srcdir/google_apis-4_r02" $pkgdir/$_addon/$pkgname
  chmod -R uog+rX ${pkgdir}/*
}
