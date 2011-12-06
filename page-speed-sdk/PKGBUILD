# Maintainer: kontakt.zuf@gmail.com
pkgname=page-speed-sdk
pkgver=1.9
pkgrel=1
#epoch=
pkgdesc="Tools from Page Speed SDK for Developers"
arch=('i686' 'x86_64')
url="https://code.google.com/intl/ru/speed/page-speed/download.html"
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=(https://dl-ssl.google.com/page-speed/sdk/current/page-speed-sdk.zip page-speed-sdk.patch)
noextract=()
md5sums=('f48cb5d3de18b51f65ce429820201bbb'
         '2142575adb28328840e8d24bb49d2054')

build() {
  cd "$srcdir/page-speed-$pkgver"
  patch -p1 -i ../page-speed-sdk.patch
  make
}

package() {
  cd "$srcdir/page-speed-$pkgver"
  #make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/bin"
  cp out/Release/har_to_pagespeed "$pkgdir/usr/bin/"
  cp out/Release/jsmin_bin "$pkgdir/usr/bin/"
  cp out/Release/minify_html_bin "$pkgdir/usr/bin/"
  cp out/Release/optimize_image_bin "$pkgdir/usr/bin/"

}

# vim:set ts=2 sw=2 et:
