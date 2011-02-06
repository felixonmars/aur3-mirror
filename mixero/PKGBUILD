# Contributor: Nathan Owe <ndowens.aur @ gmail.com>
pkgname=mixero
pkgver=0.57
pkgrel=1
pkgdesc="Twitter application using adobe-air"
arch=('i686' 'x86_64')
url="http://www.mixero.com"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
source=(http://mixero.com/media/mixero.air ${pkgname}.sh ${pkgname}.desktop)
md5sums=('c3d454668b92a3a9cd7bf4a6200604fa'
         '644761de08c34fe24c5fbc6a53c34c80'
         '58a82130ccfddcdbb7823073214a91a9')

build() {
 cd ${srcdir}/
 install -d ${pkgdir}/{usr/{share/{applications,icons/${pkgname}},/bin},opt/${pkgname}} 
 unzip mixero.air 
 cp -R icons/* ${pkgdir}/usr/share/icons/${pkgname}/ 
 install mixero.air ${pkgdir}/opt/${pkgname}/mixero.air
 install -Dm755 mixero.sh ${pkgdir}/usr/bin/mixero 
 install ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
