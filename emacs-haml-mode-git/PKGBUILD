# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>
pkgname=emacs-haml-mode-git
pkgver=20130903
pkgrel=1
pkgdesc="An emacs mode for editing HAML code."
arch=("i686" "x86_64")
url="http://haml-lang.com/"
license=('MIT')
makedepends=('git')
provides=(emacs-haml-mode)
install=emacs-haml-mode-git.install
 
_gitroot="git://github.com/nex3/haml-mode.git"
_gitname="haml-mode"
 
build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
 
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
 
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
 
  cd "$srcdir/$_gitname-build"
 
  mkdir -p $startdir/pkg/$pkgname/usr/share/emacs/site-lisp/
  install -Dm644 haml-mode.el $startdir/pkg/$pkgname/usr/share/emacs/site-lisp/
}
