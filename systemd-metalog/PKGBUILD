# Maintainer: Zsolt Udvari <udvzsolt gmail com>
pkgname=systemd-metalog
pkgver=1.0
pkgrel=2
pkgdesc="Metalog service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('metalog' 'systemd')

source=('metalog.service')
md5sums=('b9e7cc7fe3a502dd24b34416bfad90e5')

changelog=changelog

package() {
  install -Dm644 "${srcdir}/metalog.service" "${pkgdir}/lib/systemd/system/metalog.service"
}

