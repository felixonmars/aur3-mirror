# Maintainer: Raymond Wagenmaker <raymondwagenmaker at gmail dot com>
pkgname=ledit
pkgver=2.03
pkgrel=1
pkgdesc="Line editor, allowing to use shell commands with control characters like in emacs."
arch=('i686' 'x86_64')
url="http://cristal.inria.fr/~ddr/ledit/"
license=('BSD')
depends=('ncurses')
makedepends=('ocaml' 'camlp5')
source=("$url/distrib/src/$pkgname-$pkgver.tgz")
md5sums=('3a70ee7d5d5e2dfb905a1ac2e1e60276')
options=(!strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local mandir="$pkgdir/usr/share/man/man1" bindir="$pkgdir/usr/bin"
  install -d {$bindir, $mandir}
  make BINDIR="$bindir" MANDIR="$mandir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
