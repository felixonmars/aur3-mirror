# Maintainer: John H. Anthony <johnhant@gmail.com>
pkgname=emacs-develock
pkgver=0.39
pkgrel=1
pkgdesc="Additional font-lock keywords for Emacs"
arch=('any')
url="http://www.jpl.org/ftp/pub/elisp/"
license=('GPL')
depends=('emacs')
makedepends=('emacs')
install=$pkgname.install
source=(http://www.jpl.org/ftp/pub/elisp/develock.el.gz)
md5sums=('d9a1298dc5f3806abbcc709707104508')

build() {
  cd "$srcdir"
  emacs -q --no-site-file --batch -f batch-byte-compile develock.el || return 1
  install -d $pkgdir/usr/share/emacs/site-lisp/ || return 1
  install -m644 -t $pkgdir/usr/share/emacs/site-lisp/ \
    develock.elc develock.el || return 1
}
