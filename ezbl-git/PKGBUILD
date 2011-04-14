# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ezbl-git
pkgver=20110415
pkgrel=1
pkgdesc="Emacs interface for Uzbl"
arch=('any')
url=("https://github.com/haxney/ezbl")
license=('GPL3')
depends=('uzbl-core' 'emacs-xwidget')
makedepends=('git')

_gitroot="https://github.com/itsmyowninvention/ezbl.git"
_gitname="ezbl"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
 
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  emacs -batch -q -f batch-byte-compile ezbl.el
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm644 ezbl.elc $pkgdir/usr/share/emacs/site-lisp/ezbl.elc
  install -Dm644 ezbl.el $pkgdir/usr/share/emacs/site-lisp/ezbl.el
  install -d $pkgdir/usr/share/doc/ezbl
  install *.org $pkgdir/usr/share/doc/ezbl
}
