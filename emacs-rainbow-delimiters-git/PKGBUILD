# Contributor: listx <linusarver <at> gmail <dot> com>
# This file is hosted at github.com/listx/aurpkgs.

pkgname=emacs-rainbow-delimiters-git
pkgver=2.1.r0.g9eb2dff
pkgrel=1
pkgdesc="highlight matching parentheses, braces, etc. with rainbow colors for GNU Emacs"
arch=('any')
url="https://github.com/Fanael/rainbow-delimiters"
depends=('emacs')
makedepends=('git')
provides=('emacs-rainbow-delimiters')
conflicts=('emacs-rainbow-delimiters')
license=('GPL')
install=$pkgname.install
source=("$pkgname::git+https://github.com/Fanael/rainbow-delimiters#branch=master")
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$pkgname
  # compile for speed
  emacs -Q -batch --eval '(setq byte-compile-error-on-warn t)' -f batch-byte-compile rainbow-delimiters.el
  emacs -Q -batch -l rainbow-delimiters-test.el -f ert-run-tests-batch-and-exit
}

package() {
  # create destination path
  cd $srcdir/$pkgname
  install -d $pkgdir/usr/share/emacs/site-lisp/rainbow-delimiters
  # copy over files into path
  cp $srcdir/$pkgname/*.el* $pkgdir/usr/share/emacs/site-lisp/rainbow-delimiters
}
