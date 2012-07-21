# Maintainer: Leonid Selivanov <bravebug at gmail dot com>
# Maintainer: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=privoxy-systemd
pkgver=0.1
pkgrel=2
pkgdesc="Systemd unit file for Privoxy"
arch=('any')
url="http://www.privoxy.org/"
license=('GPL')
depends=('systemd' 'privoxy')
install=privoxy-systemd.install
source=('privoxy.service')
sha256sums=('d5a144868bd55ad93689d6ca8c24aa3fbbd6e0ab8fecdeddda0c88bd7cc3a068')

package() {
  install -m 644 -D "${srcdir}/privoxy.service" "${pkgdir}/lib/systemd/system/privoxy.service"
}
