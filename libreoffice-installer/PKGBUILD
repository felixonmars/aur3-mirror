# Maintainer: gobonja

PACKAGER="gobonja"
pkgname=libreoffice-installer
pkgver=0.5
pkgrel=3
pkgdesc="GUI installer for LibreOffice"
arch=('any')
url="http://www.nosonja.org"
license=('GPL')
depends=('zenity' 'terminal')
optdepends=()
source=("http://dl.dropbox.com/u/5097820/custompkgs/libreoffice-installer/${pkgname}"
        "http://dl.dropbox.com/u/5097820/custompkgs/libreoffice-installer/${pkgname}.desktop")

package() {
    mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/share/applications/ &&
    cp ${srcdir}/${pkgname} ${pkgdir}/usr/bin/ &&
    cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
}
md5sums=('49ca2bfa61f7d5180acc6b14b32295ac'
         'dc8acd6e97fa664018f6710813854069')
