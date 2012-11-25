pkgname=hellonzb
pkgver=1.1
pkgrel=1
pkgdesc="The Binary Usenet tool"
arch=('i686' 'x86_64')
url="http://hellonzb.sourceforge.net"
license=('GPL3')
depends=('jre')
optdepends=('unrar' 'par2cmdline')
makedepends=()
options=()
source=("http://downloads.sourceforge.net/project/hellonzb/version%20${pkgver}/HelloNzb.jar")
noextract=("HelloNzb.jar")
md5sums=('05f7a26faf051565ebd860f6d5b6caa6')

_installdir="/opt/${pkgname}/"
_executable=hellonzb

build() {
    cat <<EOF >${_executable}
#!/bin/bash
java -jar ${_installdir}/HelloNzb.jar
EOF
}

package() {
    install -d "${pkgdir}/${_installdir}"
    install -m0644 HelloNzb.jar "${pkgdir}/${_installdir}"
    install -m0755  "$_executable" "${pkgdir}/${_installdir}"
}
