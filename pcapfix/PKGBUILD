# Maintainer: Rafał Michalski <plum.michalski at gmail dot com>
pkgname="pcapfix"
pkgver=1.1.0
pkgrel=1
pkgdesc="pcapfix is a repair tool for corrupted pcap files. "
arch=("any")
license=("GPL v3")
depends=()
makedepends=()
conflicts=()
install=pcapfix.install
url='http://f00l.de/pcapfix/'
source=("http://f00l.de/pcapfix/$pkgname-$pkgver.tar.gz"
        "http://f00l.de/pcapfix/$pkgname-$pkgver.tar.gz.asc"
        "$pkgname.install")
sha256sums=('f2b96b6d00eb005c1cb685c9fa1f922384f08f69d7c943314d8fa7adb0beb208'
          'SKIP'
          '020954ff4ac45f19e14cb074ff5d10c274a88fced46ad189371f6904d0f3b81f')


build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

}