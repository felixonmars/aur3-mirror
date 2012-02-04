# Contributor: Nicolas Quiénot <niQo @ aur>

pkgname=play2wifi
_origpkgname=Play2wifi
pkgver=20101214
pkgrel=1
pkgdesc="Enables streaming of videos from iThing to XBMC. (Airplay)"
license=('GPL')
arch=('any')
url="http://code.google.com/p/play2wifi/"
depends=('python2' 'avahi' 'twisted' 'xbmc-eventclient-xbmc-send')
makedepends=()
backup=('play2wifi.cfg')
install=play2wifi.install
source=('http://play2wifi.googlecode.com/files/Play2wifi-0.1.tar.bz2')
sha1sums=('29772b9d2e06f1913892ce114770025890251d21')

build() {
  cd ${srcdir}/${_origpkgname}/src
  sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python2|' play2wifi.py 
  sed -i -e 's|play2wifi.cfg|/etc/play2wifi.cfg|' play2wifi.py 
  sed -i -e 's|xbmcport: 9878|xbmcport: 8080|' play2wifi.cfg
}

package() {
  mkdir -p ${pkgdir}/etc/avahi/services/
  mkdir -p ${pkgdir}/usr/bin

  install -Dm644 ${srcdir}/${_origpkgname}/src/play2wifi.service ${pkgdir}/etc/avahi/services/
  install -Dm755 ${srcdir}/${_origpkgname}/src/play2wifi.py ${pkgdir}/usr/bin
  install -Dm644  ${srcdir}/${_origpkgname}/src/play2wifi.cfg ${pkgdir}/etc/
}
