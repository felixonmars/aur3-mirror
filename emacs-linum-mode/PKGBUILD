# $Id: PKGBUILD 45684 2011-04-27 09:19:45Z spupykin $
# Maintainer: Collin J. Doering
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=emacs-linum-mode
pkgver=0.9wza
pkgrel=1
pkgdesc="Emacs linum-mode for line numbering in emacs"
arch=('any')
url="http://web.student.tuwien.ac.at/~e0225855/linum/linum.html"
license=('GPL')
depends=()
install=$pkgname.install
source=(http://web.student.tuwien.ac.at/~e0225855/linum/linum.el
	linum-$pkgver.patch)
md5sums=('ede8c10219813075181d774ca30b29f6'
	 'a89e81f4de25378986e335c3450a5621')

build() {
  cd $srcdir
  patch linum.el linum-$pkgver.patch
  emacs -batch -f batch-byte-compile linum.el
}

package() {
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  cp $srcdir/linum.el{c,} $pkgdir/usr/share/emacs/site-lisp/
}
