# Contributor: Marco Mueller <muelma at gmail dot com>
# based on the PKGBUILD of David Vilar <davvil at gmail dot com>
pkgname=sketch
pkgver=0.3.7
pkgrel=1
pkgdesc="Free Graphics Software for the TeX, LaTeX, and PSTricks Community"
arch=('i686' 'x86_64')
url="http://sketch4latex.sourceforge.net"
license=('GPL')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('c51c6a0ed6c16a95e1a1afe1afd5d70e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # The makefile does not have an install target
  mkdir -p $pkgdir/usr/bin
  install -D -m755 sketch $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/sketch
  install -D -m644 Doc/sketch.pdf $pkgdir/usr/share/doc/sketch
}

# vim:set ts=2 sw=2 et:
