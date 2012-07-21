# Maintainer: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=cdemu-systemd
pkgver=0.1
pkgrel=1
pkgdesc="Systemd unit file for CDEmu daemon"
arch=('any')
url="http://cdemu.sourceforge.net/"
license=('GPL')
depends=('systemd' 'cdemu-daemon')
install=cdemu-systemd.install
source=('cdemu.service')
sha256sums=('b9632ce6ce095bc2b25eb3338fc167467bc21a4f123de0315655e39869b5a594')

package() {
  install -m 644 -D "${srcdir}/cdemu.service" "${pkgdir}/lib/systemd/system/cdemu.service"
}
