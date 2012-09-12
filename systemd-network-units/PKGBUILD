# Maintainer: Mitch <ipha00@gmail.com>
pkgname=systemd-network-units
pkgver=1.0
pkgrel=4
pkgdesc="Static network configuration for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('iproute2' 'systemd')
install=$pkgname.install
source=('network.service'
		'network'
		'systemd-network-units.install')

sha256sums=('28f727cbe2f360e9ab5257849d636098e5cd5414ff5a71fb04fb52e00a135345'
			'e85cac6572679a4ab93f03874b21dfb4a8d5de565f82d80c65328e09458a4547'
			'970c461371e5f20bbe2c23d2e51912e0b8a0e5946eefd58d1c26296b5517c080')

package() {
 	install -Dm644 "${srcdir}/network.service" "${pkgdir}/usr/lib/systemd/system/network.service"
 	install -Dm644 "${srcdir}/network" "${pkgdir}/etc/conf.d/network"
}