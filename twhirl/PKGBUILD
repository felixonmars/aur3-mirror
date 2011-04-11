# Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=twhirl
pkgver=0.9.7
pkgrel=1
pkgdesc="A social software desktop client, based on the Adobe AIR platform. Connects to multiple Twitter, laconi.ca, identi.ca, Friendfeed and Seesmic accounts"
arch=('i686' 'x86_64')
url="http://www.twhirl.org/"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
source=("http://d.seesmic.com/twhirl/twhirl-${pkgver}.air" 
		"${pkgname}.sh" 
		"${pkgname}.desktop")
md5sums=('d34a6a915005e4c49eb9929585f5f952'
         '862bf1132f33931c2cbb37bd7b5a8f73'
         'dcbc30e6be886f453b1cb060a3b2efc6')
build(){
/bin/true
}

package()
{
   cd ${srcdir}
   install -d ${pkgdir}/{opt/${pkgname},usr/{bin,share/{applications,pixmaps/${pkgname}}}}
   unzip twhirl-${pkgver}.air -d ${srcdir}
   install -Dm644 ${pkgname}-${pkgver}.air ${pkgdir}/opt/twhirl/${pkgname}.air
   install -Dm644 icons/twhirl-48.png ${pkgdir}/usr/share/pixmaps/${pkgname}/twhirl.png
   install -Dm644 twhirl.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop 
   install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

}
