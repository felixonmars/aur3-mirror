# Maintainer: Charles Paul <charlieap@gmail.com>
pkgname=emacs-multiterm
pkgver=0.8.9
pkgrel=1
pkgdesc="Managing multiple terminal buffers in Emacs."
url="http://www.emacswiki.org/emacs/MultiTerm"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=()
conflicts=()
replaces=()
backup=()
install=emacs-multiterm.install
source=(http://www.emacswiki.org/emacs/download/multi-term.el)
sha1sums=('9c0c676f95ace2df2283a045220837ffd3f2414b')

build() {
  cd $srcdir
  emacs --batch -f batch-byte-compile multi-term.el
}

package() {
  install -m 755 -d $pkgdir/usr/share/emacs/site-lisp
  install -m 644 multi-term.{el,elc} $pkgdir/usr/share/emacs/site-lisp
}
