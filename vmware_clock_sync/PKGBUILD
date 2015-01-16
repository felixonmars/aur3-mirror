# Maintainer: Doug Richardson <dougie.richardson@gmail.com>
pkgname=vmware_clock_sync
pkgver=1.0.0
pkgrel=2
pkgdesc="Fix system clock drift that occurs when VMWare host sleeps."
arch=(any)
url="https://github.com/drichardson/arch_packages"
license=('BSD')
depends=(util-linux)
optdepends=()
backup=()
changelog=
install=vmware_clock_sync.install
source=('vmware_clock_sync.timer'
        'vmware_clock_sync.service')
sha256sums=('414873ea7afa19df53c0458afe8eb5656f368a78db0dd88a324bd80358c4ed87'
            '1246bc4357baec469c3058c1978dd2078d0c50e55a3367a8091290759ebcd5f7')

package() {
  install -Dm644 "$srcdir"/vmware_clock_sync.timer "$pkgdir"/usr/lib/systemd/system/vmware_clock_sync.timer
  install -Dm644 "$srcdir"/vmware_clock_sync.service "$pkgdir"/usr/lib/systemd/system/vmware_clock_sync.service
}
