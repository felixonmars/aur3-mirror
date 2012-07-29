# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds
#
# When submitting fixes, Github pull requests are preferred.
pkgname=systemd-mongodb-units
pkgver=0.1
pkgrel=1
pkgdesc="MongoDB service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=(mongodb systemd)
install=$pkgname.install
source=(
    mongodb.service
	systemd-mongodb-units.install
)
md5sums=(
    5f92d6cdd8cd51870af0b43906361d17
    66cf1b031d99c2cdd6d690d03fe9f908
)
package() {
    install -Dm644 "${srcdir}/mongodb.service" "${pkgdir}/usr/lib/systemd/system/mongodb.service"
}


