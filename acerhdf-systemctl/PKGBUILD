#Maintainer: Niels Neumann <vatriani[dot]nn[at]googlemail[dot]com>
pkgname=acerhdf-systemctl
pkgdesc="enable acerhdf module at boottime"
pkgver=1.0.0
pkgrel=1
url="https://github.com/vatriani/acerhdf-fix"
arch=any
license=('GPLv3')
depends=('systemd')

source=("https://github.com/vatriani/acerhdf-fix/archive/${pkgver}.tar.gz")

md5sums=('652608ab6dbcf946e624f76f2c3f1a25')

package() {
	cd ${srcdir}/acerhdf-fix-${pkgver}
	install -Dm600 acerhdf.service "$pkgdir/etc/systemd/system/acerhdf.service"
	install -Dm700 acerhdf "$pkgdir/usr/bin/acerhdf"
}

post_install() {
	systemctl enable acerhdf.service
	systemctl start acerhdf.service
}

pre_remove() {
	systemctl stop acerhdf.service
	systemctl disable acerhdf.service
}