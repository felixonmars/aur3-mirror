# Maintainer: John Regan <saxindustries@gmail.com>

pkgname=bitlbee-plugin-otr
_srcname=bitlbee
pkgver=3.0.1
pkgrel=1
pkgdesc="The OTR plugin for bitlbee"
arch=('i686' 'x86_64')
url="http://www.bitlbee.org/" 
license=('GPL')
depends=('bitlbee=3.0.1' 'libotr')
source=(http://get.bitlbee.org/src/${_srcname}-${pkgver}.tar.gz)
md5sums=('4d00c6e09859b653f955b16b988db0ac')
build() { 
	cd ${srcdir}/${_srcname}-${pkgver}
	
	./configure --prefix=/usr \
	    --otr=plugin \
		--ssl=gnutls \
		--etcdir=/etc/bitlbee \
		--pidfile=/var/run/bitlbee/bitlbee.pid \
		--ipcsocket=/var/run/bitlbee/bitlbee.sock || return 1
	make otr.so || return 1
}

package() {
	cd ${srcdir}/${_srcname}-${pkgver}

	make DESTDIR=${pkgdir} install-plugins || return 1
}
