# Maintainer: Brian Parsons <brian@pmex.com>

pkgname=ha-ocf-mysql-proxy
pkgver=1.0.0
pkgrel=1
pkgdesc="mysql-proxy heartbeat OCF script"
arch=('any')
url="http://hg.vergenet.net/linux-ha/agents/file/03efdc3cbe63/heartbeat/mysql-proxy"
license=('GPL')
depends=('ha-heartbeat')
optdepends=('mysql-proxy: mysql-proxy daemon')
source=("http://hg.vergenet.net/linux-ha/agents/raw-file/03efdc3cbe63/heartbeat/mysql-proxy")
md5sums=("bc56738d79d39a1d9751630289154274")

package() {

        install -D -m755 ${srcdir}/mysql-proxy ${pkgdir}/etc/ha.d/resource.d/mysql-proxy

}
