# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn_proxy
pkgver=0.0.1
pkgrel=1
pkgdesc="Convert OpenVPN TCP connections into UDP connections"
arch=('i686' 'x86_64')
url="http://oss.tiggerswelt.net/openvpn_proxy/"
license=('GPL')
makedepends=('git')
depends=('openvpn' 'libevent')
source=('http://oss.tiggerswelt.net/openvpn_proxy/openvpn_proxy.c'
	'http://oss.tiggerswelt.net/openvpn_proxy/Makefile'
	'openvpn_proxy.service'
	'openvpn_proxy.conf')
backup=('etc/conf.d/openvpn_proxy')

build() {
	cd ${srcdir}/

	make
}

package() {
	cd ${srcdir}/

	install -D -m0755 ${srcdir}/openvpn_proxy ${pkgdir}/usr/bin/openvpn_proxy
	install -D -m0644 ${srcdir}/openvpn_proxy.service ${pkgdir}/usr/lib/systemd/system/openvpn_proxy.service
	install -D -m0644 ${srcdir}/openvpn_proxy.conf ${pkgdir}/etc/conf.d/openvpn_proxy

}

sha256sums=('9ef177753734c87556889690fab4e5692fbe37f248ecf22e0cfa9d3bf0a2822a'
            '2eb3a559725cd80d7cdf576e4a1d889b4200dfc8d4cf2554b1555684c3c63632'
            'c083add3762802884e8ee368ac13b970a34765b4274e701b9f101915c76f9154'
            'b583700c30db7a88148a270ff159f1926460fa2181d1c3dcc669bccad0f0d493')
