# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=aircontrol-beta
pkgver=1.4.2
pkgrel=3
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
 "aircontrol-rc"
 "aircontrol.conf"
)
md5sums=(
  'c3ae75b31fef9f1af0560b22cd7b8c2b'
  '84f06766883bf2d74737862ada60cde6' 
  '515368c7346cf5c262d16aa2f8b49f86'
)

build() {
    mkdir -p ${pkgdir}/opt/ || return 1
    mkdir -p ${pkgdir}/etc/rc.d/ || return 1
    mkdir -p ${pkgdir}/etc/conf.d/ || return 1

    cp -r ${srcdir}/aircontrol ${pkgdir}/opt/ || return 1
    chmod 755 ${pkgdir}/opt/aircontrol/bin/*sh || return 1

    install aircontrol-rc ${pkgdir}/etc/rc.d/aircontrol || return 1
    install aircontrol.conf ${pkgdir}/etc/conf.d/aircontrol || return 1
}
