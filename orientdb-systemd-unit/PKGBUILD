# Maintainer: Gianni Vialetto <gianni at rootcube dot net>

pkgname=orientdb-systemd-unit
pkgver=1
pkgrel=1
pkgdesc="A systemd service unit for OrientDB"
arch=('any')
url="http://www.rabbitmq.com/"
license=('BSD')
depends=('orientdb' 'systemd')
install='orientdb-systemd-unit.install'
source=('orientdb.service')
md5sums=('5c73c7ccf39c55cab8a724e0e6d3e040')

package() {
  cd "$srcdir"
  install -m644 -D ${srcdir}/orientdb.service ${pkgdir}/usr/lib/systemd/system/orientdb.service
}

