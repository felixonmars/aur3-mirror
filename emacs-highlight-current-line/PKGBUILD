pkgname=emacs-highlight-current-line
pkgver=0.57
pkgrel=1
pkgdesc="A minor mode to highlight the line the cursor is in"
url="http://www.emacswiki.org/cgi-bin/wiki/highlight-current-line.el"
license=("GPL")
arch=('any')
depends=('emacs')
install=emacs-highlight-current-line.install
source=("http://www.emacswiki.org/cgi-bin/wiki/download/highlight-current-line.el")
md5sums=('81ca2a36ce91043ade66b56bf63674ff')

build() {
  cd $srcdir
  emacs --batch -f batch-byte-compile highlight-current-line.el
  install -dm755 $pkgdir/usr/share/emacs/site-lisp/
  install -Dm644 highlight-current-line.el $pkgdir/usr/share/emacs/site-lisp/
  install -Dm644 highlight-current-line.elc $pkgdir/usr/share/emacs/site-lisp/
}
