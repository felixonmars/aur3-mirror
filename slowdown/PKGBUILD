# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=slowdown
pkgver=0.2.1
_pkgver=${pkgver}-20090204-160027
pkgrel=2
pkgdesc="Slowdowns pipes and processes. Can be attached to running processes"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('glibc')
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('dadfb085688430e0c5e158ef2228bdde')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  make || return 1
  install -d ${pkgdir}/usr/bin
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
