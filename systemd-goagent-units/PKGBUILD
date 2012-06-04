# Maintainer: skatiger <skatiger at gmail dot com>
pkgname=systemd-goagent-units
pkgver=1.0
pkgrel=3
pkgdesc="GoAgent service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('goagent' 'systemd')
install=$pkgname.install
source=('goagent.service'
	'systemd-goagent-units.install')
package() {
  install -Dm644 "${srcdir}/goagent.service" "${pkgdir}/usr/lib/systemd/system/goagent.service"
}
md5sums=('a0223e4e436a4d5cc17f76fc1fbbc140'
         '371ff1f28973b34eb7ff3913e3b3267f')
