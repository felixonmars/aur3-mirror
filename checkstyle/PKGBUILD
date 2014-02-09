# Maintainer: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com

pkgname='checkstyle'
pkgver='5.7'
pkgrel=1
pkgdesc='Checkstyle is a development tool to help programmers write Java code that adheres to a coding standard'
depends=('jdk7-openjdk')
arch=('i686' 'x86_64')
license=('LGPL2')
url='http://checkstyle.sourceforge.net'
source=(
    "http://downloads.sourceforge.net/project/checkstyle/checkstyle/${pkgver}/${pkgname}-${pkgver}-bin.tar.gz"
    'checkstyle')
md5sums=(
    '8cea84ef0dc49811c35a0681f6a02d2b'
    '6e76042b6eab9602ee2cfceb3880af43')

function package() {
    local destdir="${pkgdir}/opt/${pkgname}"
    local bindir="${pkgdir}/usr/bin"

    mkdir -pv ${destdir}
    mkdir -pv ${bindir}

    cp -r "${srcdir}/${pkgname}-${pkgver}"/* ${destdir}

    install -m755 "${srcdir}/${pkgname}" ${bindir}
}
