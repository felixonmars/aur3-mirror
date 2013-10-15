# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Thomas Etcheverria <tetcheve@gmail.com>
pkgname=emacs-powerline-git
pkgver=2.3
pkgrel=2
pkgdesc="Have a nice bar in Emacs"
arch=('any')
url="https://github.com/milkypostman/powerline"
license=('GPL')
depends=("emacs")

_gitroot=https://github.com/milkypostman/powerline.git
_gitname=powerline

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
  emacs -L "$srcdir/$_gitname-build" -batch -f batch-byte-compile powerline.el powerline-themes.el powerline-separators.el
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d ${pkgdir}/usr/share/emacs/site-lisp/
  cp powerline.el{,c} ${pkgdir}/usr/share/emacs/site-lisp/
  cp powerline-themes.el{,c} ${pkgdir}/usr/share/emacs/site-lisp/
  cp powerline-separators.el{,c} ${pkgdir}/usr/share/emacs/site-lisp/
}


# vim:set ts=2 sw=2 et:
