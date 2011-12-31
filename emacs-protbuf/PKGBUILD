# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Laurent Ollagnier <laurent + aur at xenbox dot fr>
pkgname=emacs-protbuf  
pkgver=1.7
pkgrel=1 
pkgdesc="This package allows you to make it harder to kill buffers accidentally."
url="http://www.splode.com/~friedman/software/emacs-lisp/"
arch=('any')
license=('GPL2')
depends=('emacs')
install=$pkgname.install
source=(http://www.splode.com/~friedman/software/emacs-lisp/src/protbuf.el)
md5sums=('30b4328cb481ec0984939340a6b94663')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "protbuf.el"))' || return 1
  cp protbuf.el{,c} $startdir/pkg/usr/share/emacs/site-lisp || return 1
}