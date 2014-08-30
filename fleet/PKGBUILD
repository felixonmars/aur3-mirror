# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=fleet
pkgver=v0.7.1
pkgrel=1
pkgdesc='A distributed init system.'
arch=('any')
url='https://github.com/coreos/fleet'
license=('Apache')
source=("https://github.com/coreos/${pkgname}/releases/download/${pkgver}/fleet-${pkgver}-linux-amd64.tar.gz")
md5sums=('5e88c47da728030244f4e28e446fb831')

package() {
  cd "$srcdir/fleet-$pkgver-linux-amd64"
  install -Dm755 fleet "$pkgdir/usr/bin/fleet"
  install -Dm755 fleetctl "$pkgdir/usr/bin/fleetctl"
}
