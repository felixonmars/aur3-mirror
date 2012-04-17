# Maintainer: rex <nex_ren@163.com>

pkgname=pure-ftpd-rfc2640
realpkgname=pure-ftpd
pkgver=1.0.36
pkgrel=1
pkgdesc="Pure-FTPD is a free(BSD), secure,production-quality and standard-conformant FTP server"
arch=('i686' 'x86_64')
url="http://www.pureftpd.org/"
license=('custom')
depends=('openssl' 'libmysqlclient')
backup=('etc/pure-ftpd.conf')
source=("http://download.pureftpd.org/pub/${realpkgname}/releases/${realpkgname}-${pkgver}.tar.bz2" 'pure-ftpd')
build() {
	cd ${srcdir}/${realpkgname}-${pkgver}
	./configure --prefix=/usr \
		--with-brokenrealpath --with-mysql --with-altlog --with-puredb \
		--with-extauth --with-cookie --with-throttling --with-ftpwho \
		--with-ratios --with-quotas --with-uploadscript --with-virtualhosts \
		--with-diraliases --with-peruserlimits --with-rfc2640 \
		--with-tls --with-language=english
	make
}

package() {
	cd ${srcdir}/${realpkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -D -m755 ${srcdir}/pure-ftpd ${pkgdir}/etc/rc.d/pure-ftpd
	install -D -m644 configuration-file/pure-ftpd.conf ${pkgdir}/etc/pure-ftpd.conf
	install -D -m755 configuration-file/pure-config.pl ${pkgdir}/usr/sbin/pure-config.pl
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${realpkgname}/LICENSE

}
md5sums=('7899c75c1fed7dbad0352eb31080e066'
         'ad65d79f421242b1952cb919feb61817')
