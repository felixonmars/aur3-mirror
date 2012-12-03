# Maintainer: Thibault Suzanne <thi [DOT] suzanne [AT] gmail [DOT] com>
pkgname=tuareg-caml-mode
pkgver=svn_11156
pkgrel=2
pkgdesc="Support for old caml-mode functions for tuareg, especially caml-types.el ones"
url="https://forge.ocamlcore.org/projects/tuareg/"
source="http://forge.ocamlcore.org/frs/download.php/471/tuareg-caml-mode.tar.gz"
arch=('any')
license=('GPL')
depends=('emacs')
md5sums=('9502557d267e2bcac53684e34a76b3dd')

build() {
  cd ${srcdir}/tuareg-caml-mode
  emacs --batch --eval '(progn
                          (push "." load-path)
                          (byte-compile-file "caml-emacs.el")
                          (byte-compile-file "caml-help.el")
                          (byte-compile-file "caml-types.el")
                          (byte-compile-file "caml-xemacs.el"))'
  install -d ${pkgdir}/usr/share/emacs/site-lisp/tuareg || return 1
  cp *.el{,c} \
    ${pkgdir}/usr/share/emacs/site-lisp/tuareg || return 1
}
