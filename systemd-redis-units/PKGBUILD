# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds
#
# Based partially on https://bbs.archlinux.org/viewtopic.php?id=135922
# and ntpd.service.
#
# When submitting fixes, Github pull requests are preferred.
pkgname=systemd-redis-units
pkgver=0.1
pkgrel=2
pkgdesc="Redis service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('redis' 'systemd')
install=$pkgname.install
source=(
    redis.service
	systemd-redis-units.install
)
md5sums=(
    225a745d08dedbebbeb1546d09a42252
    3db5f790ddd1fc7d83afe94da5075309
)
package() {
  install -Dm644 "${srcdir}/redis.service" "${pkgdir}/usr/lib/systemd/system/redis.service"
}


