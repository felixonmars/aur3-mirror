# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=aircontrol-beta
pkgver=1.3.6
pkgrel=1
pkgdesc='AirControl is a powerful and intuitive web based server network management application which allows operators to centrally manage entire networks of Ubiqutii devices.'

arch=('i686' 'x86_64')
provides=()
replaces=()
license=('PROPRIETARY')
url='http://www.ubnt.com/aircontrol/'
depends=('java-runtime')
makedepends=()
options=('')
backup=()
source=(
 "http://www.ubnt.com/downloads/aircontrol/aircontrol-${pkgver}-beta.tar.gz" 
 aircontrol-rc
)
md5sums=('be5ceb81d31a0c45fc489453d372fe90' '84f06766883bf2d74737862ada60cde6')

build() {
    mkdir -p ${pkgdir}/opt/ || return 1
    mkdir -p ${pkgdir}/etc/rc.d/ || return 1
    cp -r ${srcdir}/aircontrol ${pkgdir}/opt/ || return 1
    chmod 755 ${pkgdir}/opt/aircontrol/bin/*sh || return 1
    install aircontrol-rc ${pkgdir}/etc/rc.d/aircontrol || return 1
}
