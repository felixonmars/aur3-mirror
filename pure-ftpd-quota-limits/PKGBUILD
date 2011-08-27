# Contributor: Simplet <simplet _AT_ ptigeek.net>
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=pure-ftpd-quota-limits
pkgver=1.0.29
pkgrel=1
pkgdesc="A fast, production quality, standards-conformant FTP server. Compiled for Virtual User with quota and peruser limits."
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
backup=('etc/pure-ftpd.conf')
source=("ftp://ftp.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${pkgver}.tar.bz2"
	'pure-ftpd')

sha256sums=('b9217802d2674c0471fc43004565d4630e0938ca8530c3a1b73361d405259f5f'
            'a5931bcb6c63b65d532776c206dc9cb464efa4ea7afda131e11e855b1349fdb0')
build() {
	cd ${srcdir}/pure-ftpd-${pkgver}
	./configure --prefix=/usr \
	   --with-everything \
	   --without-inetd \
	   --with-peruserlimits
	make
}

package() {
	cd ${srcdir}/pure-ftpd-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm755 ${srcdir}/pure-ftpd ${pkgdir}/etc/rc.d/pure-ftpd
	install -Dm644 configuration-file/pure-ftpd.conf ${pkgdir}/etc/pure-ftpd.conf
	install -Dm755 configuration-file/pure-config.pl ${pkgdir}/usr/sbin/pure-config.pl
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/pure-ftpd/LICENSE
}
