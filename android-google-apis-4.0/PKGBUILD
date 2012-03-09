# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=android-google-apis-4.0
pkgver=r02
pkgrel=2
pkgdesc="API add-on for Google Android SDK 4.0"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis/index.html"
license=('custom')
depends=('android-4.0>=r02')
_sdk=android-sdk
_addon="opt/${_sdk}/add-ons"
_platform="opt/${_sdk}/platforms"
_android_ver=android-14

source=("http://dl-ssl.google.com/android/repository/google_apis-14_r02.zip")

md5sums=('fd26148fc3f720d54c9d8ce16d9c0e1f')

package() {
  cd "$pkgdir"
  mkdir -p $_addon
   
  mv "$srcdir/google_apis-229537-mac-x86" $pkgdir/$_addon/$pkgname
  chmod -R uog+rX ${pkgdir}/*
}
