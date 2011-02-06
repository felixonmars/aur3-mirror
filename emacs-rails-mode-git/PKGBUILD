# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>
pkgname=emacs-rails-mode-git
pkgver=20090713
pkgrel=1
pkgdesc="An emacs minor mode for editing Ruby on Rails code."
arch=("i686" "x86_64")
url="http://github.com/tomtt/emacs-rails/tree/master"
license=('GPL')
groups=()
depends=(emacs-snippet-template-mode emacs-find-recursive emacs-ruby-mode)
makedepends=('git' 'emacs-snippet-template-mode')
provides=(emacs-rails-mode)
install=emacs-rails-mode-git.install

_gitroot="git://github.com/tomtt/emacs-rails.git"
_gitname="emacs-rails"

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

  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp/rails-mode
  install -Dm644 *.el $startdir/pkg/usr/share/emacs/site-lisp/rails-mode
}
