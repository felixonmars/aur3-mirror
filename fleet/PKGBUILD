# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=fleet
pkgver=v0.3.0
pkgrel=2
pkgdesc='A distributed init system.'
arch=('any')
url='https://github.com/coreos/fleet'
license=('Apache')
source=("https://github.com/coreos/${pkgname}/releases/download/${pkgver}/fleet-${pkgver}-linux-amd64.tar.gz")
md5sums=('038ec69bcbb6ec2f6d63a8c2fd81a6e1')

package() {
  cd "$srcdir/fleet-$pkgver-linux-amd64"
  install -Dm755 fleet "$pkgdir/usr/bin/fleet"
  install -Dm755 fleetctl "$pkgdir/usr/bin/fleetctl"
}
