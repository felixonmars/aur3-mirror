# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Nick Lanham <nick@afternight.org>
pkgname=emacs-expand-region-git
pkgver=20120128
pkgrel=1
pkgdesc="Region select for GNU Emacs that increases the selected region by semantic units."
url="https://github.com/magnars/expand-region.el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
install=$pkgname.install

_gitroot="git://github.com/magnars/expand-region.el.git"
_gitname="expand-region"

_pkg_emacs=$pkgdir/usr/share/emacs/site-lisp/

build() {
  if [ -d $srcdir/$_gitname/ ]; then
    cd $srcdir/$_gitname/ && git pull origin
    msg "The local files are up to date"
  else
    git clone $_gitroot $_gitname
  fi

  msg "Updated to latest git version"

  install -d $_pkg_emacs/$_gitname

  cd "$srcdir/$_gitname"
  install -m 644 *.el $_pkg_emacs/$_gitname
}