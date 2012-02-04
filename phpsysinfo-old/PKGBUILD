pkgname=phpsysinfo-old
_pkgname=phpsysinfo
pkgver=2.5.4
pkgrel=2
pkgdesc="PHP script that displays information about the host. Old javascript-less version."
arch=('any')
license=('GPL2')
url="http://phpsysinfo.sourceforge.net/"
depends=('php')
optdepends=('lm_sensors: for providing temperature')
conflicts=('phpsysinfo')
source=(http://downloads.sourceforge.net/sourceforge/phpsysinfo/phpsysinfo/$pkgver/${_pkgname}-$pkgver.tar.gz)
md5sums=('5bf79793255ff24d5f9cbc6a62705aa7')
install=$pkgname.install

build() {
  _instdir=${startdir}/pkg/srv/http/phpsysinfo
  mkdir -p ${_instdir}
  cd ${_instdir}
  cp -ra ${srcdir}/phpsysinfo/* .  || return 1
  mv config.php.new config.php
  
  # fix all the 755 perms on files
  find * -type f -exec chmod 644 {} \;
}
