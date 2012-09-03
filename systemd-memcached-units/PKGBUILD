# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds
#
# When submitting fixes, Github pull requests are preferred.
pkgname=systemd-memcached-units
pkgver=0.2
pkgrel=1
pkgdesc="Memcached service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('memcached' 'systemd')
install=$pkgname.install
source=(
    memcached.service
	systemd-memcached-units.install
)
md5sums=(
    3c78d1244dfd0186f325dfc0d2156fb2
    6599787a42de21fe37db717d5adaeffa
)
package() {
  install -Dm644 "${srcdir}/memcached.service" "${pkgdir}/etc/systemd/system/memcached.service"
}


