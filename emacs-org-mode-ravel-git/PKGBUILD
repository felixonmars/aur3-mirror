# Maintainer: Rasmus <arch@pank.eu>

pkgname=emacs-org-mode-ravel-git
pkgver=r32.4ba4dcb
pkgrel=1
pkgdesc="R-ravel backends for Emacs Org-mode"
arch=('i686' 'x86_64')
url="https://github.com/chasberry/orgmode-accessories"
depends=(emacs emacs-org-mode)
license=('GPL')
source=("$pkgname::git://github.com/chasberry/orgmode-accessories.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  emacs --batch --eval "(progn (require 'ox-latex) (require 'ox-html) (require 'ox-md) (find-file \"ox-ravel.org\") (org-babel-tangle))"
  emacs -batch -f batch-byte-compile ox-ravel.el
}

package() {
  cd "$pkgname"

  install -Dm 644 ox-ravel.el "$pkgdir/usr/share/emacs/site-lisp/ox-ravel.el"
  install -Dm 644 ox-ravel.elc "$pkgdir/usr/share/emacs/site-lisp/ox-ravel.elc"

  mkdir -p "$pkgdir/usr/share/doc/ox-ravel/"
  for i in *.org; do
    install -Dm 644 $i "$pkgdir/usr/share/doc/e-ravel/$i"
  done
}
