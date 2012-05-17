# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=emacs-rudel-git
pkgver=20120517
pkgrel=1
pkgdesc="A collaborative editing environment for GNU Emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/Rudel"
license=('GPL')
depends=('emacs' 'cedet')
makedepends=('git')
conflicts=('emacs-rudel-svn')
install=$pkgname.install

_gitroot="git://github.com/scymtym/rudel.git"
_gitname="rudel"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  emacs --script rudel-compile.el
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/share/emacs/site-lisp/rudel"
  cp -a * "$pkgdir/usr/share/emacs/site-lisp/rudel"
}

# vim:set ts=2 sw=2 et:
