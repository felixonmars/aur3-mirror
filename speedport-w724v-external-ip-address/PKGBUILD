# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>

pkgname=speedport-w724v-external-ip-address
pkgver=1.0
pkgrel=1
pkgdesc='A utility application to determine the external (public) IPv4 address of the router SpeedPort W724V.'
license=('MIT')
arch=('any')
url=('https://github.com/koutheir/speedport-w724v-external-ip-address')
depends=('coreutils' 'jq' 'curl')
source=("https://github.com/koutheir/${pkgname}/archive/release${pkgver}.tar.gz")
md5sums=('637c45dcdbf14174c67342946d74f552')

package() {
	install -Dm755 ${srcdir}/${pkgname}-release${pkgver}/speedport-w724v-external-ip-address ${pkgdir}/usr/bin/speedport-w724v-external-ip-address
	install -Dm755 ${srcdir}/${pkgname}-release${pkgver}/device_password.conf ${pkgdir}/etc/speedport_w724v/device_password.conf
}

post_install() {
	echo "Router access password needs to be specified before using this application."
	echo "Please check: /etc/speedport_w724v/device_password.conf"
}

post_upgrade() {
	true
#	post_install
}

post_remove() {
	true
}
