# Contributors:
#	henning mueller <henning@orgizm.net>

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with "linux-pax"'
pkgver=1.0.21
pkgrel=2
arch=(any)
url='https://aur.archlinux.org/packages.php?ID=55491'
license=(GPL2)
depends=(bash paxctl)
source=($pkgname)
sha256sums=(d762836210649d828894cfc5b1d1a0529115470ca3141003c44c9008634ac6c3)

build() {
  return 0
}

package() {
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
