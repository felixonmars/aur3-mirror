# Maintainer: Vinzenz Vietzke <vinz@vinzv.de>

pkgname=openbox-blackcoal-theme
_tname="Black_Coal_OpenBOX_Theme_by_Jaanos"
pkgver=1.0
pkgrel=1
pkgdesc="Dark Openbox theme"
arch=('any')
url="http://jaanos.deviantart.com/art/Black-Coal-OpenBOX-Theme-110224412"
license=('gpl')
depends=('openbox')
source=(http://www.deviantart.com/download/110224412/$_tname.zip)
md5sums=('73bb23ac66441a9139683d1b056690f7')

build() {
    /bin/true
}

package () {
    cd ${srcdir}
    unzip $_tname.zip
    tar xf BlackCoal/BlackCoal.obt
    mkdir -p ${pkgdir}/usr/share/themes
    cp -r BlackCoal ${pkgdir}/usr/share/themes/
}
