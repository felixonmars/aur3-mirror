# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=netbeans-ide-ru
_name=netbeans
pkgver=7.3
_pkgver=201302132200
pkgrel=1
pkgdesc='Netbeans IDE development platform.'
arch=('any')
url='http://www.netbeans.org'
license=('CDDL')
depends=('java-environment')
optdepends=(
        'php: for developing programs in php'
        'groovy: for developing programs in groovy'
        )
options=('!strip')
install=netbeans.install
source=("http://dlc.sun.com.edgesuite.net/netbeans/${pkgver}/final/zip/netbeans-${pkgver}-${_pkgver}.zip"
        'netbeans.desktop')
sha256sums=('0c1fbb318086ecb1cda8393f8f501e887a46af1c492776353e1e162bfd3f0559'
            '66031dd97f971cb90c8d5f73e12c669b05ebcaeedbfa8e6897257e1f584396c9')

package() {
    rm ${_name}/bin/netbeans.exe
    rm ${_name}/bin/netbeans64.exe

    install -d ${pkgdir}/usr/share/${_name}
    cp -r ${_name}/* ${pkgdir}/usr/share/${_name}/

    install -D -m644 netbeans.desktop ${pkgdir}/usr/share/applications/netbeans.desktop

    install -d ${pkgdir}/usr/bin
    ln -s /usr/share/netbeans/bin/netbeans ${pkgdir}/usr/bin/netbeans
}
