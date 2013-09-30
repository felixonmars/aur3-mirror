# Contributor: Dimitris Zervas <01ttouch@gmail.com>
# Contributor: Simplet <simplet _AT_ ptigeek.net>
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=pure-ftpd-mysql
pkgver=1.0.36
pkgrel=1
pkgdesc="A fast, production quality, standards-conformant FTP server. Compiled for Virtual User with quota, peruser limits, mysql and TLS support."
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
backup=('etc/pure-ftpd/pure-ftpd.conf')
source=("ftp://ftp.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${pkgver}.tar.bz2"
	'pure-ftpd'
	'pure-ftpd.service')

sha256sums=('16e3cff004c80d752ff85e8a011a523867c7f2ab99af0f9c170891118e0fcc6b'
            'f80cb0d3073da2ac870c07d3b860c82bd3c728575a51812c3c770d3bad7beb33'
	    '5e0a5e37976c08ed525c6765ff585c34c0461a0f82dde53004349ea45044a86a')
build() {
	cd ${srcdir}/pure-ftpd-${pkgver}
	./configure --prefix=/usr \
	   --with-everything \
	   --without-inetd \
	   --with-peruserlimits \
	   --with-mysql \
	   --with-tls
	make
}

package() {
	cd ${srcdir}/pure-ftpd-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm755 ${srcdir}/pure-ftpd ${pkgdir}/etc/rc.d/pure-ftpd
	install -Dm755 ${srcdir}/pure-ftpd.service  ${pkgdir}/etc/systemd/system/pure-ftpd.service
	install -Dm644 configuration-file/pure-ftpd.conf ${pkgdir}/etc/pure-ftpd/pure-ftpd.conf
	install -Dm755 configuration-file/pure-config.pl ${pkgdir}/usr/bin/pure-config.pl
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/pure-ftpd/LICENSE
}
