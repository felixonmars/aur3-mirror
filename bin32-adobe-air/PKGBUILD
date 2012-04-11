# Maintainer: syne <madlikene@aim.com>
pkgname=bin32-adobe-air
pkgver=2.6
pkgrel=3
license='custom'
arch=('x86_64')
pkgdesc="Crossplatform desktop applications build using proven web technologies (for Arch64)"
url="http://labs.adobe.com/technologies/air/"
source=("http://airdownload.adobe.com/air/lin/download/latest/AdobeAIRSDK.tbz2"
        "adobe-air")
md5sums=('5466178bf7764f043d2225e6d018319c'
         '77162e1a7649f875f52df8b79e231a31')
provides=('adobe-air')
depends=('lib32-gcc-libs' 'lib32-gtk2' 'lib32-cairo' 'lib32-glibc' 'lib32-nss' 'unzip' 'coreutils' 'lib32-glib2' 'lib32-libx11' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-libxml2' 'lib32-libxext' 'lib32-xcb-util' 'lib32-libxslt' 'lib32-libxt')
install=${pkgname}.install

build() {
  cd $startdir/pkg/
  mkdir -p opt/adobe-air-sdk usr/share/licenses/$pkgname

  cd $startdir/src/
  mv 'AIR SDK license.pdf' $startdir/pkg/usr/share/licenses/$pkgname/
  mv AIR\ SDK\ Readme.txt bin frameworks lib runtimes samples templates $startdir/pkg/opt/adobe-air-sdk/

  chmod +x $startdir/adobe-air
  install -D -m 755 $startdir/adobe-air $startdir/pkg/opt/lib32/usr/bin/adobe-air
}
