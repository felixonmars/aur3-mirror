# Maintainer: David Phillips <dbphillipsnz@gmail.com>
pkgname=ntp-before-init
pkgver=1.1
pkgrel=1
pkgdesc="Sets the time using ntpd before running the real init (for boxes without RTCs)"
arch=(any)
url="https://github.com/phillid"
license=('GPL')
groups=()
depends=(ntp)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/ntp-before-init.conf)
options=()
install=
changelog=
source=('ntp-before-init'
	'ntp-before-init.conf')
sha1sums=('47a920664d4b474e8dca6f5bac2dce05e9993c94'
          '53db3c6f0245fce5ea34755e45fce97e6b7362bd')

package() {
	cd "$srcdir"
	install -Dm 755 ntp-before-init           "${pkgdir}/sbin/ntp-before-init"
	install -Dm 644 ntp-before-init.conf      "${pkgdir}/etc/ntp-before-init.conf"
}
