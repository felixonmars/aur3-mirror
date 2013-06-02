# Maintainer: Joseph C. Lehner <joseph DOT c DOT lehner AT gmail.com>
pkgname=netcfg-pppoa
pkgver=1.0
pkgrel=1
pkgdesc="PPPoATM support for netcfg"
url="https://wiki.archlinux.org/index.php/DSL_SpeedTouch_modem"
arch=(any)
license=('GPL')
depends=('netcfg>=2.5' 'ppp')
source=(pppoa-connection pppoa-example)

md5sums=('f9185d6f7b328b458890108be4f0e037'
         '571c2dd0125f710b1d401bb7a67a5143')

package() {
	mkdir -p "${pkgdir}/etc/network.d/examples"

	install -m 644 -D "${srcdir}/pppoa-example" "${pkgdir}/etc/network.d/examples/pppoa"
	install -m 755 -D "${srcdir}/pppoa-connection" "${pkgdir}/usr/lib/network/connections/pppoa"
}
