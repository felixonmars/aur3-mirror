# Maintainer: Zach Latta <zach@zachlatta.com>

pkgname=fleet
pkgver=v0.2.0
pkgrel=1
pkgdesc='A distributed init system.'
arch=('any')
url='https://github.com/coreos/fleet'
license=('Apache')
source=("https://github.com/coreos/${pkgname}/releases/download/${pkgver}/fleet-${pkgver}-linux-amd64.tar.gz")
md5sums=('92d67aa902f9b9e3fa97b4e334e779d7')

package() {
  cd "$srcdir/fleet-$pkgver-linux-amd64"
  install -Dm755 fleet "$pkgdir/usr/bin/fleet"
  install -Dm755 fleetctl "$pkgdir/usr/bin/fleetctl"
}
