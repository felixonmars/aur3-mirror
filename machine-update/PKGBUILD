# Maintainer: Max Roder <maxroder@web.de>
# Contributor: Mathias Buren <mathias.buren@gmail.com>

pkgname=machine-update
pkgver=0.32
pkgrel=2
pkgdesc="The Linux Counter automatic update script"
url="https://linuxcounter.net/script"
arch=('any')
license=('GPL2')
depends=('perl')
source=("https://linuxcounter.net/script/${pkgname}")
md5sums=('0a7124625f2fd8b828d51a03c6e6f9b5')

package() {
	install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
