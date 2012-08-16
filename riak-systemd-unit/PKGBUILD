# Maintainer: Gianni Vialetto <gianni at rootcube dot net>

pkgname=riak-systemd-unit
pkgver=1
pkgrel=1
pkgdesc="A systemd service unit for the riak distributed database"
arch=('any')
url="http://riak.basho.com/"
license=('BSD')
depends=('riak' 'systemd')
source=('riak.service')
md5sums=('689297bfc10ab881780a90c13469f4fc')

package() {
  cd "$srcdir"
  install -m 644 -D "${srcdir}/riak.service" "${pkgdir}/usr/lib/systemd/system/riak.service"
}

