# Maintainer: Nick Smallbone <nick.smallbone@gmail.com>
pkgname=emacs-markup-faces-git
pkgver=20120915
pkgrel=1
pkgdesc="Collection of faces used by emacs-adoc-mode-git"
arch=('any')
url="https://github.com/sensorflo/markup-faces"
license=('GPL')
depends=('emacs')
makedepends=('git')

_gitroot=git://github.com/sensorflo/markup-faces.git
_gitname=markup-faces

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
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 markup-faces.el "$pkgdir/usr/share/emacs/site-lisp/markup-faces.el"
}
