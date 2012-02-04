# Maintainer: tuxce <tuxce.net@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Wang Lun <iseuer@gmail.com>

pkgname=pure-ftpd-charsets
_pkgname=pure-ftpd
pkgver=1.0.30
pkgrel=1
pkgdesc="A fast, production quality, standards-conformant FTP server with charsets(RFC2640) enabled"
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
depends=('openssl' 'libmysqlclient')
backup=('etc/pure-ftpd.conf')
source=("ftp://ftp.pureftpd.org/pub/${_pkgname}/releases/${_pkgname}-${pkgver}.tar.bz2"
	'pure-ftpd')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	./configure --prefix=/usr \
	   --with-puredb \
	   --with-ftpwho \
	   --with-altlog \
	   --with-tls    \
	   --with-mysql  \
	   --with-rfc2640
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm755 ${srcdir}/pure-ftpd ${pkgdir}/etc/rc.d/pure-ftpd
	install -Dm644 configuration-file/pure-ftpd.conf ${pkgdir}/etc/pure-ftpd.conf
	install -Dm755 configuration-file/pure-config.pl ${pkgdir}/usr/sbin/pure-config.pl

	#install license
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
md5sums=('865a9020dbe48d30913c796ac3ec1f32'
         '13cf942b643db7cf3e612185366391ca')
