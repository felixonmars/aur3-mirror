# Maintainer: Nicoco <truenicoco_AT_gmail.com>
pkgname=winamax
pkgver=1.7.0
pkgrel=1
pkgdesc="Winamax poker client"
arch=('any')
url="http://www.winamax.fr/"
license=(Commercial)
source=('http://dl.vip.winamax.fr/client/wam/wam.air' 'winamax' 'winamax.desktop')

SKIPINTEG=1
package() {
    cd "${srcdir}"
    install -D -m755 "winamax" "${pkgdir}/usr/bin/winamax"
    install -D -m644 "winamax.desktop" "${pkgdir}/usr/share/applications/winamax.desktop"
    
    install -d "${pkgdir}/opt/winamax"
    cp * ${pkgdir}/opt/winamax -R
    rm ${pkgdir}/opt/winamax/winamax ${pkgdir}/opt/winamax/winamax.desktop ${pkgdir}/opt/winamax/wam.air
    chown root ${pkgdir}/opt/winamax -R
    chmod 755 ${pkgdir}/opt/winamax -R
}
