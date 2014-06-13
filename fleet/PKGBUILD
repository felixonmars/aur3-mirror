# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=fleet
pkgver=v0.5.0
pkgrel=5
pkgdesc='A distributed init system.'
arch=('any')
url='https://github.com/coreos/fleet'
license=('Apache')
source=("https://github.com/coreos/${pkgname}/releases/download/${pkgver}/fleet-${pkgver}-linux-amd64.tar.gz")
md5sums=('35464b3c8098a74f54e95ac36e41b233')

package() {
  cd "$srcdir/fleet-$pkgver-linux-amd64"
  install -Dm755 fleet "$pkgdir/usr/bin/fleet"
  install -Dm755 fleetctl "$pkgdir/usr/bin/fleetctl"
}
