# Maintainer: theseattlite <theseattlite at gmail dot com>
pkgname=systemd-hiawatha-units
pkgver=1.0
pkgrel=5
pkgdesc="systemd service files for the Hiawatha webserver"
arch=('any')
url="http://www.hiawatha-webserver.org"
license=('MIT')
install=$pkgname.install
source=('hiawatha.service'
	'systemd-hiawatha-units.install')
md5sums=('0733e3d3a72deebabb4640655badcb9b'
         '014e6209199b7bea2c5e9182d7b9e718')
package() {
  install -Dm644 "${srcdir}/hiawatha.service" "${pkgdir}/usr/lib/systemd/system/hiawatha.service"
}


