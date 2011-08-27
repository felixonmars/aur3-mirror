# Maintainer:  <clu>
pkgname=emacs-rect-mark
_pkgname=rect-mark
pkgver=1.4
pkgrel=1 
pkgdesc="The packages makes it possible to highlight the region between point and mark as a rectangle, before you operate on a rectangle."
url="http://www.emacswiki.org/cgi-bin/wiki/RectangleMark"
arch=('i686' 'x86_64')
license=('GPL')
depends=('emacs')
makedepends=('emacs')
conflicts=()
replaces=()
backup=()
install=$pkgname.install
source=(http://www.emacswiki.org/emacs/download/$_pkgname.el)
md5sums=('1ff908fcbac93b5722026b5a68fa0c74')

build() {
  cd $srcdir
  emacs -batch -q -f batch-byte-compile $_pkgname.el || return 1
}

package() {
  cd $srcdir
  install -Dm644 $srcdir/$_pkgname.el \
    $pkgdir/usr/share/emacs/site-lisp/$_pkgname.el || return 1
  install -Dm644 $srcdir/$_pkgname.elc \
    $pkgdir/usr/share/emacs/site-lisp/$_pkgname.elc || return 1
}