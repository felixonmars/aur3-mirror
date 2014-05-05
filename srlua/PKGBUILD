# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
pkgname=srlua
pkgdesc='A tool for generating native binaries from lua'
url='http://www.tecgraf.puc-rio.br/~lhf/ftp/lua'
pkgver=2012.05.07
pkgrel=1
license=('custom')
arch=('i686' 'x86_64')
makedepends=('curl')
depends=('lua')
source=("${url}/5.2/srlua.tar.gz"
        'makefile.patch')

_srcsum="$(curl ${url}/release.txt | grep -i '5.2/srlua' | cut -d ' ' -f18)"
md5sums=("${_srcsum}"
         '9487624bfb0967b27fbda42d4229843d')

pkgver () {
    cd "${srcdir}"
    curl "${url}/release.txt" | grep -i '5.2/srlua' | cut -d ' ' -f9 | sed -e 's|-|.|g'
}

prepare () {
    cd "${srcdir}"
    patch -p0 "${pkgname}/Makefile" makefile.patch
}

build () {
    cd "${srcdir}/${pkgname}"
    make a.out # creates both srlua and glue binaries
}

check () {
    cd "${srcdir}/${pkgname}"
    make test
}

package () {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
    install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm755 'glue' "${pkgdir}/usr/bin/glue"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    echo "This program is in the public domain." > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
