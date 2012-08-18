# Maintainer: Jimmy Xu <me@jimmyxu.org>

pkgname=minerva
_pkgname=Minerva
pkgver=3.3.3
_pkgver=3-3-3
pkgrel=1
pkgdesc='An AIR Shared Object Editor'
arch=('any')
url="http://blog.coursevector.com/minerva"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
noextract=("${_pkgname}-${_pkgver}.air")
source=(http://www.coursevector.com/downloads/${_pkgname}-${_pkgver}.air
        minerva
        minerva.desktop)

package()
{
    cd ${srcdir}
    install -d ${pkgdir}/{usr/{bin,share/{applications,icons/${pkgname}}},opt/${pkgname}}

    unzip -oq ${_pkgname}-${_pkgver}.air -d ${srcdir}/

    install -Dm644 assets/icons/clouds_128.png ${pkgdir}/usr/share/icons/${pkgname}/
    install -Dm644 ${_pkgname}-${_pkgver}.air ${pkgdir}/opt/${pkgname}/${_pkgname}.air

    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('92afd07aa67f56862582ee0653a2d7d6'
         'd1ba572445414842215b2f818d22c7b5'
         'd789af7d27f066d86a30d7edfad47e3b')
