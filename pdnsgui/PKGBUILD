# Contributor: Filip <fila@pruda.com>

pkgname=pdnsgui
pkgver=0.3.3
pkgrel=2
pkgdesc="Web based GUI which aids in administering domains and records for the PowerDNS name server software with MySQL backend."
arch=('any')
license=('GPL2')
url="http://code.google.com/p/pdns-gui/"
backup=(srv/http/pdnsgui/config/databases.yml srv/http/pdnsgui/config/propel.ini)
depends=('php' 'mysql')
source=(http://pdns-gui.googlecode.com/files/pdns-gui.$pkgver.tgz patch.diff)
md5sums=('caa45c5408764ccd98cfffd69e5e976f' 'd5538b035e50605357703e0e346c8cd1')
install=$pkgname.install

build() {

  patch -p1 < patch.diff || return 1

  _instdir=${startdir}/pkg/srv/http/pdnsgui
  mkdir -p ${_instdir}
  cd ${_instdir}
  
  cp -ra ${srcdir}/pdns-gui.$pkgver/* .  || return 1
  chmod 777 cache
  chmod 777 log
  
}
