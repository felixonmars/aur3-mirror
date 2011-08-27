# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=sq
pkgver=0.5.0
_pkgver=${pkgver}-20090529-180428
pkgrel=1
pkgdesc="SQLite3 query tool for shell usage with pipes"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2')
depends=('sqlite3')
source=(http://www.scylla-charybdis.com/download/${pkgname}-${_pkgver}.tar.gz)
md5sums=('103b94dab140ecceb211b558d94a61b5')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  make || return 1
  install -d ${pkgdir}/usr/bin
  install -m 755 sq3 ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
