# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=emacs-framemove
pkgver=0.9
pkgrel=1
pkgdesc="Directional frame selection routines for Emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/framemove.el"
license=('GPL3')
depends=('emacs')
install=$pkgname.install
source="http://www.emacswiki.org/emacs/download/framemove.el"
md5sums=('bf9f30fca37fa0d4b5ab613ffc8c1561')

build() {
  emacs -batch -f batch-byte-compile $srcdir/framemove.el
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  install -Dm644 framemove.el framemove.elc $pkgdir/usr/share/emacs/site-lisp
}
