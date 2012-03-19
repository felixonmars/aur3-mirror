# Maintainer: Thibaut Horel <thibaut.horel@gmail.com>

pkgname=typerex
pkgver=1.0.1
pkgrel=1
pkgdesc="A development environment for OCaml"
arch=('i686' 'x86_64')
url="http://www.typerex.org"
license=('GPL3' 'custom')
depends=('ocaml>=3.11.2' 'emacs>=23.2.1')
optdepends=('emacs-auto-complete-git: for the auto-completion')
install=typerex.install
source=(http://www.typerex.org/pub/$pkgname-$pkgver.tar.bz2)
sha1sums=('ed5c91014f672d146b5f52c57fbd0396992d01dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr/ \
  --with-lispdir=/usr/share/emacs/site-lisp \
  --disable-auto-complete
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver" 
  make BINDIR="$pkgdir/usr/bin" EMACSDIR="$pkgdir/usr/share/emacs/site-lisp" install
  install -d $pkgdir/usr/share/{doc,licenses}/$pkgname/
  cp -r docs/user-manual/* $pkgdir/usr/share/doc/$pkgname/
  install -m644 LICENSE* $pkgdir/usr/share/licenses/$pkgname/
  install -m644 AUTHORS $pkgdir/usr/share/doc/$pkgname/
  install -m644 -D emacs.append $pkgdir/usr/share/$pkgname/config.el
}
