# Maintainer: Aur Saraf <sonoflilit@gmail.com>
pkgname=emacs-openwith
pkgver=0
pkgrel=1
pkgdesc="Minor mode to open files with external programs"
url="http://www.emacswiki.org/emacs/OpenWith"
arch=('any')
license=('GPL')
depends=('emacs')
source=(http://stud4.tuwien.ac.at/~e0225855/misc/openwith.el)
md5sums=('616fa2cbd95dd6b302bec5b7c150b002')

build() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/emacs/site-lisp
  for _i in *.el
  do
    emacs --batch -q -f batch-byte-compile ${_i}
    install ${_i} $pkgdir/usr/share/emacs/site-lisp/${_i}
    install ${_i}c $pkgdir/usr/share/emacs/site-lisp/${_i}c
  done || return 1
}
