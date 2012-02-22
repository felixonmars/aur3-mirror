# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=emacs-popwin-git
pkgver=20111226
pkgrel=1
pkgdesc="Popup Window Manager for Emacs"
arch=(any)
url="https://github.com/m2ym/popwin-el"
license=('GPL')
groups=()
depends=('emacs')
makedepends=('git')
provides=(emacs-popwin)
conflicts=(emacs-popwin)
install=emacs-popwin.install
options=()
noextract=()

_gitroot=https://github.com/m2ym/popwin-el.git
_gitname=emacs-popwin

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

  #
  # BUILD HERE
  #
  emacs --batch -f batch-byte-compile *.el
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d ${pkgdir}/usr/share/emacs/site-lisp/popwin
  cp *.el *.elc ${pkgdir}/usr/share/emacs/site-lisp/popwin
}

# vim:set ts=2 sw=2 et:
