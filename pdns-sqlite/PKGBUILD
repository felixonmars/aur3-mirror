# Maintainer: Mark Constable <markc@renta.net>
pkgname=pdns-sqlite
pkgver=2.9.21
pkgrel=1
pkgdesc="SQlite backend for PowerDNS"
arch=(i686 x86_64)
url="http://www.powerdns.com"
license=(GPL)
makedepends=('boost')
depends=("pdns=${pkgver}" 'sqlite3')
source=(http://downloads.powerdns.com/releases/pdns-${pkgver}.tar.gz)
md5sums=('a0d650dd1489ed46b36dfcc1d73653af')

build() {
  cd ${startdir}/src/pdns-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--libdir=/usr/lib/powerdns \
	--with-modules="" \
	--with-dynmodules="gsqlite3" \
	--with-sqlite-includes=/usr/include
  cd modules/gsqlite3backend
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm ${startdir}/pkg/usr/lib/powerdns/*.{,l}a
}
