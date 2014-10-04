# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=alrd-buildimg
pkgver=0.86
pkgrel=1
pkgdesc="A script that builds the Arch Linux Rescue Disk iso images."
arch=("any")
url="https://github.com/Gen2ly/alrd-buildimg"
license=("GPL2")
depends=("")
changelog=
source=("git://github.com/Gen2ly/alrd-buildimg")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$pkgname
  git describe | sed 's/^v//;s/-.*//'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname"      "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 "$pkgname".conf "$pkgdir"/etc/"$pkgname".conf
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
