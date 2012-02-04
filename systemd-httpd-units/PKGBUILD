# Maintainer: Benjamin Arnoult <benjamin.arnoult@yahoo.fr>
pkgname=systemd-httpd-units
pkgver=1.0
pkgrel=1
pkgdesc="Apache service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('apache' 'systemd')
install=$pkgname.install
source=('httpd.service'
	'httpd.conf'
	'systemd-httpd-units.install')
md5sums=('9e116a6457871ff7234333f813a36918'
	 'ff48d04cdeb8577941ec03b2c80e2c27'
	 'c35bb62d97e1c3b70df22437bc9f5083')
package() {
  install -Dm644 "${srcdir}/httpd.service" "${pkgdir}/lib/systemd/system/httpd.service"
  install -Dm644 "${srcdir}/httpd.conf" "${pkgdir}/etc/tmpfiles.d/httpd.conf"
}


