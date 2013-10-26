# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=emacs-direx-mode-git
pkgver=0.1alpha
pkgrel=1
pkgdesc="A simple directory explorer for Emacs."
arch=('x86_64' 'i686')
url="https://github.com/m2ym/direx-el"
license=('GPL')
groups=()
depends=(emacs)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=install.sh
source=()
noextract=()

_gitroot=https://github.com/m2ym/direx-el
_gitname=direx-el

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d -m755 "$pkgdir"/usr/share/emacs/site-lisp
  install -m755 direx-project.el direx.el "$pkgdir"/usr/share/emacs/site-lisp
}
