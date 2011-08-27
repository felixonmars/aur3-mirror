# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=keypressed
pkgver=0.1.0
_pkgver=${pkgver}-20090304-005423
pkgrel=2
pkgdesc="Nonblocking, nondestructible test for waiting data on TTYs, sockets and probably pipes"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('1673e0d597558d2fc7f841a57bf29063')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  make || return 1
  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
