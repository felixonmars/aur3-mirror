# Contributors:
#	henning mueller <henning@orgizm.net>

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with "linux-pax"'
pkgver=1.0.13
pkgrel=1
arch=(any)
url='https://aur.archlinux.org/packages.php?ID=55491'
license=(GPL2)
depends=(bash paxctl)
source=($pkgname)
md5sums=(cf7a72ab796805773ee75d1988c67c21)

build() {
  return 0
}

package() {
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
