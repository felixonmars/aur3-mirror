# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Laurent Ollagnier <laurent@wolverine>
pkgname=emacs-browsekillring
pkgver=1.3a
pkgrel=1 
pkgdesc="interactively insert items from kill-ring"
url="http://www.emacswiki.org/emacs/BrowseKillRing"
arch=('any')
license=('GPL')
depends=('emacs')
source=(http://www.emacswiki.org/emacs/download/browse-kill-ring.el)
md5sums=('c266ce2633dd7b08dff5a875f1d11746')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "browse-kill-ring.el"))' || return 1
  cp browse-kill-ring.el{,c} $startdir/pkg/usr/share/emacs/site-lisp || return 1
}
