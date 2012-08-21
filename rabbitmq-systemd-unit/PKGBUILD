# Maintainer: Gianni Vialetto <gianni at rootcube dot net>

pkgname=rabbitmq-systemd-unit
pkgver=5
pkgrel=1
pkgdesc="A systemd service unit for rabbitmq"
arch=('any')
url="http://www.rabbitmq.com/"
license=('BSD')
install='rabbitmq-systemd-unit.install'
depends=('rabbitmq' 'systemd')
source=('rabbitmq.service')
md5sums=('476e4756c390912ab2713a1b7b0e415f')

package() {
  cd "$srcdir"
  install -m 644 -D "${srcdir}/rabbitmq.service" "${pkgdir}/usr/lib/systemd/system/rabbitmq.service"
}

