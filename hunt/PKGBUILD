# Contributor: Florian Pritz <flo@xinu.at>

pkgname=hunt
pkgver=1.5
pkgrel=2
pkgdesc="TCP connection hijacker"
arch=(i686 x86_64)
url="http://packetstormsecurity.org/sniffers/hunt/"
license=('GPL')
source=(http://packetstorm.foofus.com/sniffers/$pkgname/$pkgname-$pkgver.tgz )
md5sums=('5a8886784d1668a8518d5562bfd01ae7')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/hunt-network"
}

# vim:set ts=2 sw=2 et:
