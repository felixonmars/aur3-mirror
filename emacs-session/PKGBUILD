# Maintainer: Nick Smallbone <nick.smallbone@gmail.com>
# Contributor: Yuval Hager <yuval@yhager.com>
pkgname=emacs-session
pkgver=2.3a
pkgrel=1
pkgdesc="Session management for Emacs"
arch=('i686' 'x86_64')
url="http://emacs-session.sourceforge.net/"
license=('GPL')
makedepends=('emacs' 'cvs')
source=(http://downloads.sourceforge.net/emacs-session/session-$pkgver.tar.gz)
md5sums=('f39bcdd2867dcbc016e269c7fa1be8b3')


build() {
  cd "$srcdir/session/lisp"
  emacs -batch -f batch-byte-compile session.el
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  cp session.el* $pkgdir/usr/share/emacs/site-lisp/.
}
