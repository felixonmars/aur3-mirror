# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname=systemd-arno-iptables-firewall
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="systemd service file for arno-iptables-firewall"
arch=('any')
url="https://github.com/sarum9in/arch_builds"
license=('GPL')
groups=()
depends=('arno-iptables-firewall')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('arno-iptables-firewall.service')
noextract=()
md5sums=('f1cf99a2f5428d41042c55a65cbb3d26')

build() {
  true
}

check() {
  true
}

package() {
  install -D -m 0644 "$srcdir/arno-iptables-firewall.service" \
                     "$pkgdir/usr/lib/systemd/system/arno-iptables-firewall.service"
}

# vim:set ts=2 sw=2 et:
