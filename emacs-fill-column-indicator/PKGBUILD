# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=emacs-fill-column-indicator
pkgver=1.84
pkgrel=2
pkgdesc="Graphically indicate the fill column in Emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/fill-column-indicator.el"
license=('GPL')
depends=('emacs')
install=$pkgname.install
source="http://www.emacswiki.org/emacs/download/fill-column-indicator.el"
md5sums=('39e66e40f09df2add9123eff6ef1ac84')

build() {
  emacs -batch -f batch-byte-compile $srcdir/fill-column-indicator.el
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  install -Dm644 fill-column-indicator.el fill-column-indicator.elc $pkgdir/usr/share/emacs/site-lisp
}
