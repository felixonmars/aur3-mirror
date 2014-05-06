# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jason R Begley (jayray@digitalgoat.com>

pkgname=freeradius30-git
pkgver=3.0.0.beta0.r4260.gdb53338
pkgrel=1
pkgdesc="The premier open source RADIUS server - git branch v3.0.x checkout"
arch=('i686' 'x86_64')
url="http://www.freeradius.org/"
license=('GPL')
depends=('krb5' 'pth' 'net-snmp' 'postgresql-libs' 'libmariadbclient' 'talloc')
makedepends=('git' 'libpcap' 'unixodbc' 'python2')
optdepends=('libpcap' 'unixodbc' 'python2')
provides=('freeradius')
conflicts=('freeradius' 'freeradius-git')
options=('!makeflags')
install=freeradius.install
source=('git://git.freeradius.org/freeradius-server.git#branch=v3.0.x'
	'freeradius.tmpfiles'
	'freeradius.service')
md5sums=('SKIP'
         'f959e89812bedfc9f8308076f78cd74e'
	 'e3f18e3a25df3b692e59f60605354708')

pkgver() {
	cd freeradius-server/

	# do not use --tags here!
	if GITTAG="$(git describe --abbrev=0 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd freeradius-server/

	./configure \
		--disable-developer \
		--enable-heimdal-krb5 \
		--libdir=/usr/lib/freeradius \
		--localstatedir=/var \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--with-system-libltdl \
		--with-system-libtool \
		--with-udpfromto
	make
}

package() {
	cd freeradius-server/

	make install R=${pkgdir}
	chmod o+r ${pkgdir}/etc/raddb/*
	mv ${pkgdir}/etc/raddb ${pkgdir}/etc/raddb.default
	rm -rf ${pkgdir}/var/run

	install -Dm0644 ${srcdir}/freeradius.service ${pkgdir}/usr/lib/systemd/system/freeradius.service
	install -Dm0644 ${srcdir}/freeradius.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/freeradius.conf
}
