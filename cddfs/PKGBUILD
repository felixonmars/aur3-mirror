# Contributor: Chris Brannon <cmbrannon79@gmail.com>
pkgname=cddfs
pkgver=0.2
pkgrel=2
pkgdesc="Mount audio CDs using a FUSE-based filesystem"
arch=(i686 x86_64)
url="http://castet.matthieu.free.fr/cddfs/"
license=('GPL')
depends=(fuse cdparanoia)
provides=(cddfs)
source=("http://castet.matthieu.free.fr/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a685c0076a38e9299c3df3a39fdea4ca')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m755 -d "$pkgdir/usr/bin" || return 1
  install -m755 -d "$pkgdir/usr/share/doc/$pkgname" || return 1
  install -m755 cddfs "$pkgdir/usr/bin/cddfs" || return 1
  install -m644 README "$pkgdir/usr/share/doc/cddfs" || return 1
}

# vim:set ts=2 sw=2 et:
