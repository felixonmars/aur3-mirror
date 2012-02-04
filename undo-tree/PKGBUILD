# Maintainer: abf <zouxiaoming@gmail.com>

pkgname=undo-tree
pkgver=0.3.1
pkgrel=1
pkgdesc="A plugin for emacs which Treat undo history as a tree"
arch=('any')
license=('GPLv3')
url=http://www.dr-qubit.org/emacs.php#undo-tree
install=$pkgname.install
depends=()
optdepends=('emacs')
makedepends=('git')

_gitroot=http://www.dr-qubit.org/git/undo-tree.git
_gitname=undo-tree

package() {
  cd "$srcdir"
  msg "Connecting to www.dr-qubit.org"
  if [ -d "$startdir/src/$_gitname" ] ;then
	  cd "$_gitname" && git pull origin
	  msg "The local files are updated."
  else
	  git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"
  cd "$srcdir/$_gitname"
  git checkout master
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/

  cp -rp undo-tree.el $pkgdir/usr/share/emacs/site-lisp
}

# vim:set ts=2 sw=2 et:
