# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=fleet
pkgver=v0.6.2
pkgrel=8
pkgdesc='A distributed init system.'
arch=('any')
url='https://github.com/coreos/fleet'
license=('Apache')
source=("https://github.com/coreos/${pkgname}/releases/download/${pkgver}/fleet-${pkgver}-linux-amd64.tar.gz")
md5sums=('e2b016eed34727b42eecad9d42774f6b')

package() {
  cd "$srcdir/fleet-$pkgver-linux-amd64"
  install -Dm755 fleet "$pkgdir/usr/bin/fleet"
  install -Dm755 fleetctl "$pkgdir/usr/bin/fleetctl"
}
