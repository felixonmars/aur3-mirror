# Contributor: Nathan Owe <ndowens.aur @ gmail.com>
pkgname=statuzer
pkgver=0.8.5
pkgrel=2
pkgdesc="A multi-platform Twitter Client"
arch=('i686' 'x86_64')
url="http://www.statuzer.com"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
source=(http://statuzer.com/Statuzer.air ${pkgname}.sh ${pkgname}.desktop)
md5sums=('50823a0460dd6ea5d6766b144b47ea08'
         'fc1698eca17998822e439a80504fa7af'
         '0b8e11dec5258aa25adb6a9c3fbe3942')
build() {
 cd ${srcdir}/
 install -d ${pkgdir}/{usr/{share/{applications,icons/${pkgname}},/bin},opt/${pkgname}} 
 unzip Statuzer.air 
 cp -R icons/* ${pkgdir}/usr/share/icons/${pkgname}/ 
 install -Dm644 Statuzer.air ${pkgdir}/opt/${pkgname}/  
 install -Dm755 statuzer.sh ${pkgdir}/usr/bin/statuzer 
 install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
}
