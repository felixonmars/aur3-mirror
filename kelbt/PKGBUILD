# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kelbt
pkgver=0.15
pkgrel=1
pkgdesc="Kelbt - backtracking LALR(1) parsers generator"
arch=('i686' 'x86_64')
url="http://www.complang.org/kelbt"
license=('GPL')
depends=()
source=("http://www.complang.org/kelbt/$pkgname-$pkgver.tar.gz")
md5sums=('c480692e26998edcc8735513c902cecc')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/CFLAGS =/&-fpermissive /' kelbt/Makefile.in
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/kelbt"
  install -d "$pkgdir/usr/bin"
  install -s kelbt "$pkgdir/usr/bin/kelbt"
}

# vim:set ts=2 sw=2 et:
