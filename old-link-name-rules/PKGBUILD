# Maintainer: Jonas Weber <contact@jonasw.de>
pkgname=old-link-name-rules
pkgver=1.0.0
pkgrel=1
pkgdesc="Use \"old\" names for network interfaces (like eth0) instead of enp2s0"
arch=('any')
license=('GPL')
depends=('udev')
makedepends=('coreutils')
url="https://github.com/thriqon/old-link-name-rules"

package() {
	install -d $pkgdir/etc/udev/rules.d/
	touch $pkgdir/etc/udev/rules.d/80-net-setup-link.rules
}
