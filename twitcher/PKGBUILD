# Contributor: Nathan Owe <ndowens.aur @ gmail.com>
pkgname=twitcher
pkgver=1.7.1
pkgrel=2
pkgdesc="Twitter application using adobe-air"
arch=('i686' 'x86_64')
url="http://www.coderanger.com/twitcher/"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
source=(http://coderanger.com/twitcher/twitcher.air ${pkgname}.sh ${pkgname}.desktop)
md5sums=('699115dbbd87045bdfe4b14caa6b8079'
         'c56a6f954ceae3713964847aa8e735cd'
         '5008113e1144eee05a86938fb8c336d7')

build() {
 cd ${srcdir}/
 install -d ${pkgdir}/{usr/{share/{applications,pixmaps},/bin},opt/${pkgname}} 
 unzip ${pkgname}.air 
 install -Dm644 images/twitcher_48.png ${pkgdir}/usr/share/pixmaps/ 
 install -Dm644 ${pkgname}.air ${pkgdir}/opt/${pkgname}/  
 install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname} 
 install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
}
