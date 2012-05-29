# Maintainer: skatiger <skatiger at gmail dot com>
pkgname=systemd-mysqld-units
pkgver=1.0
pkgrel=3
pkgdesc="MySQL service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('mysql' 'systemd')
install=$pkgname.install
source=('mysqld.service'
	'mysqld.conf'
	'systemd-mysqld-units.install')
package() {
  install -Dm644 "${srcdir}/mysqld.service" "${pkgdir}/usr/lib/systemd/system/mysqld.service"
  install -Dm644 "${srcdir}/mysqld.conf" "${pkgdir}/etc/tmpfiles.d/mysqld.conf"
}


md5sums=('6287ac1705d1faf03ebe0f96903bac78'
         '1ca502e9e2d3d5b84fdd2a1c90cc60f2'
         '7f028bf6fe9214ccad5b6a5cd6d87feb')
