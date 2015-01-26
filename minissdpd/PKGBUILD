# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='minissdpd'
pkgver='1.3'
pkgrel='1'
pkgdesc='Small daemon to speed up SSDP device discoveries'
url='http://miniupnp.tuxfamily.org/minissdpd.html'
arch=('arm' 'i686' 'x86_64')
depends=('glibc')
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::http://miniupnp.tuxfamily.org/files/download.php?file=${pkgname}-${pkgver}.tar.gz"
	minissdpd.service
	minissdpd )
sha1sums=('24d5179810ba58029df64b27ad7c244d3e5b6d9b'
          'f4b6f4805173038088ef93d48cb8759b5d6dba30'
          '8274b31638f343875a659ac6ea8c9702011b305a')

build () {
	cd "${pkgname}-${pkgver}"
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	install -m 755 -d "${pkgdir}/sbin"
	install -m 700 -t "${pkgdir}/sbin" minissdpd

	install -m 755 -d "${pkgdir}/usr/share/man/man1"
	install -m 644 -t "${pkgdir}/usr/share/man/man1" minissdpd.1

	install -m 755 -d "${pkgdir}/etc/conf.d"
	install -m 600 -t "${pkgdir}/etc/conf.d" "${srcdir}/minissdpd"

	install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m 644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/minissdpd.service"
}
