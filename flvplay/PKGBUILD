# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=flvplay
pkgver=1.20
pkgrel=1
pkgdesc="Adobe AIR media player that plays local or remote flv/mp4 videos"
arch=('i686' 'x86_64')
url="http://www.riaforge.co.uk/go/flvplay/index.html"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
source=(http://www.riaforge.co.uk/go/flvplay/flvplay.zip ${pkgname} ${pkgname}.desktop)
md5sums=('2a5f9957452b2641ff444b125b8b9bcb'
         'ff33c4c7d700a2d8d63d0d7621420e28'
         '152a541775e101423692486bb294a661')

build() {
  cd ${srcdir}/
  
  install -d ${pkgdir}/{opt/${pkgname},usr/{bin,share/{applications,pixmaps}}}
  unzip FLVPlay.air
  install -Dm644 assets/runtime/icons/icon48.png ${pkgdir}/usr/share/pixmaps/flvplay.png
  install FLVPlay.air ${pkgdir}/opt/${pkgname}/FLVPlay.air
  install ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m755 flvplay ${pkgdir}/usr/bin/flvplay
}
