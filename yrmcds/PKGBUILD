# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=yrmcds
pkgver=1.0.4
pkgrel=1
pkgdesc='A memcached compatible KVS with master/slave replication'
arch=('i686' 'x86_64')
url="http://cybozu.github.io/yrmcds/"
license=('BSD')
depends=('gperftools')
source=("https://github.com/cybozu/yrmcds/archive/v${pkgver}.tar.gz" "yrmcds.service")

build() {
	cd "${srcdir}/yrmcds-${pkgver}"
	make
}

package() {
	cd "${srcdir}/yrmcds-${pkgver}"
	install -Dm755 yrmcdsd "${pkgdir}/usr/bin/yrmcds"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 etc/logrotate "${pkgdir}/etc/logrotate.d/yrmcds"
	install -Dm644 etc/yrmcds.conf "${pkgdir}/etc/yrmcds.conf"
	install -Dm644 /dev/null "${pkgdir}/var/log/yrmcds.log"
	install -Dm644 ../yrmcds.service "${pkgdir}/usr/lib/systemd/system/yrmcds.service"
}

md5sums=('8897edc747fe6637f7fcfd7495f80bf6'
         'd7c394a2c529c647243e5e8213a0e93b')
