## Contributor/Maintainer: Nathan "Necopinus" <nathan@ecopunk.info>
##
## Based on the PKGBUILD for bitlbee-libpurple

pkgname=bitlbee-openssl
_pkgname=bitlbee
pkgver=3.0.4
pkgrel=1
pkgdesc="Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC - linked against OpenSSL instead of GNUTLS"
arch=('i686' 'x86_64')
url="http://www.bitlbee.org/" 
license=('GPL')
depends=('glib2' 'libotr' 'openssl')
makedepends=('pkgconfig')
optdepends=('xinetd: to run bitlbee through xinetd')
conflicts=('bitlbee' 'bitlbee-bzr' 'bitlbee-bzr-libpurple' 'bitlbee-libpurple' 'bitlbee-msn-xiaoi' 'bitlbee-otr' 'bitlbee-otr-bzr' 'bitlbee-recode')
install=${_pkgname}.install
backup=(etc/bitlbee/bitlbee.conf etc/bitlbee/motd.txt etc/xinetd.d/bitlbee)
source=(http://get.bitlbee.org/src/${_pkgname}-${pkgver}.tar.gz
	'bitlbee.xinetd'
	'bitlbee.rcd')
sha512sums=('33359d5ed5a8f681a877a260decacfb63719f899c9138726e546bd5a26a955d867dc782da1c5c6442b06c3c4810ed017aa278713ce94fb514baed5ef2bd485ba'
            'ff417d4e2b4d79273e8fac2704b609caa908d60bb2f9acbc35d9bd5ea59d9d674cac0c3ed81eaadc349bc1e0aa153faec82dcb68816424621c11bcdf33691ff7'
            '90c7de716ad4f1ce1faf0204c3a379a5b4a880903b522a8c6efd82cb8e1d27b26b223234f9d2ec1219c82b9599049308a12316826a2f0c90a8301bee8fa5c3a2')

build() { 
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	./configure --prefix=/usr \
		--ssl=openssl \
		--etcdir=/etc/bitlbee \
		--pidfile=/run/bitlbee/bitlbee.pid \
		--ipcsocket=/run/bitlbee/bitlbee.sock \
		--otr=1

	# This is a stupid fix, but I can't figure out how to modify the relevant
	# EFLAGS during the ./configure phase.
	sed -i -e 's/-lotr/-lotr -lgcrypt/' Makefile.settings

	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	install -dm755 ${pkgdir}/var/lib
	install -o65 -g65 -dm0770 ${pkgdir}/var/lib/bitlbee
	install -dm755 ${pkgdir}/var/run
	install -o65 -g65 -dm755 ${pkgdir}/var/run/bitlbee
	install -Dm644 ${srcdir}/bitlbee.xinetd ${pkgdir}/etc/xinetd.d/bitlbee
	install -Dm755 ${srcdir}/bitlbee.rcd ${pkgdir}/etc/rc.d/bitlbee
	make DESTDIR=${pkgdir} install
	make DESTDIR=${pkgdir} install-etc
	make DESTDIR=${pkgdir} install-dev
}
