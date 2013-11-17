# Maintainer: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com

pkgname='checkstyle'
pkgver='5.6'
pkgrel=3
pkgdesc='Checkstyle is a development tool to help programmers write Java code that adheres to a coding standard'
depends=('jdk7-openjdk')
arch=('i686' 'x86_64')
license=('LGPL2')
url='http://checkstyle.sourceforge.net'
source=(
    "http://downloads.sourceforge.net/project/checkstyle/checkstyle/${pkgver}/${pkgname}-${pkgver}-bin.zip"
    'checkstyle')
md5sums=(
    '5e169758daee9868b11c96c33626bb9d'
    'ea2a87471e532828f496618233be03ba')

function package() {
    local destdir="${pkgdir}/opt/${pkgname}"
    local bindir="${pkgdir}/usr/bin"

    mkdir -pv ${destdir}
    mkdir -pv ${bindir}

    cp -r "${srcdir}/${pkgname}-${pkgver}"/* ${destdir}

    install -m755 "${srcdir}/${pkgname}" ${bindir}
}
