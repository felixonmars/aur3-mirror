pkgname=systemd-unit
pkgver=0.2
pkgrel=1
pkgdesc="rc.d script that launches service defined in systemd service unit file"
url="https://github.com/kozec/systemd-unit"
license=('BSD')
arch=('any')
depends=('initscripts-fork')
source=("systemd-unit")

build() {
    true
}

package() {
    install -D -m 755 "${srcdir}/systemd-unit" "${pkgdir}/etc/rc.d/systemd-unit"
}

md5sums=('0f6683ae62375af70fccbf2ea1671981')
