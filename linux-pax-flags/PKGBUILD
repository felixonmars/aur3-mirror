# Contributors:
#	henning mueller <henning@orgizm.net>

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with "linux-pax"'
pkgver=1.0.21
pkgrel=3
arch=(any)
url='https://aur.archlinux.org/packages.php?ID=55491'
license=(GPL2)
depends=(bash paxctl)
source=($pkgname)
sha256sums=(624d520be04a8eb68d012ed1a0826bf6c509d0f3fcee608b5d9cda45273029e0)

build() {
  return 0
}

package() {
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
