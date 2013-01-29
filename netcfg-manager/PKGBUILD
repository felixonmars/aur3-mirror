# Maintainer: Paul Hunnisett <arch AT redfruit DOT co DOT uk>
pkgname=netcfg-manager
pkgver=1.0
pkgrel=1
pkgdesc="Manages netcfg profiles to allow netcfg to start user defined profiles and stop when one succeeds"
url="http://www.archlinux.org"
arch=('any')
license=('GPL3')
depends=('bash')
backup=('etc/netcfg-manager.conf')
source=("https://www.dropbox.com/s/m3itcvgbf8bi8ct/$pkgname-$pkgver.tar")
md5sums=('f9f7d9459e3e976bb2066ff0fb972ae6')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 netcfg-manager "$pkgdir/usr/bin/netcfg-manager"
  install -Dm644 netcfg-manager.service "$pkgdir/usr/lib/systemd/system/netcfg-manager.service"
  install -Dm644 netcfg-manager.conf "$pkgdir/etc/netcfg-manager.conf"
}
