# Contributor: wido <widowild [at] myopera [dot] com>

pkgname=python-loic
_pkgname=pythonLOIC
pkgver=2.6.2
pkgrel=3
pkgdesc="Python low orbit ion cannon (loic)"
arch=('any')
url="http://code.google.com/p/pythonloic/"
license=('CUSTOM')
depends=('python' 'python-irclib' 'scapy')
makedepends=()
optdepends=()
source=(http://pythonloic.googlecode.com/files/${_pkgname}_${pkgver}.zip)
md5sums=('92532e7c55df0c9c0b57bdd9db84085d')

build() {
    true
}

package() {
    cd ${srcdir}/
    install -d ${pkgdir}/opt/${pkgname}
    cp ${srcdir}/${_pkgname}${pkgver}/*.py ${pkgdir}/opt/${pkgname}

    # Patch
    #sed -i 's:'ubuntu':'archlinux':' ${pkgdir}/opt/${pkgname}/pythonLoic${pkgver}_python3.py

    #Launcher

    install -d ${pkgdir}/usr/bin/
    echo "#!/bin/bash
    cd /opt/python-loic
    python ./pythonLoic${pkgver}_python3.py" > ${pkgdir}/usr/bin/${pkgname}

    chmod 755 ${pkgdir}/usr/bin/${pkgname}

}
