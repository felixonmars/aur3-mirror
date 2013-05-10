# Maintainer: Yang Bai <hamo.by@gmail.com>

pkgname=clang-complete-bin
pkgver=20130510
pkgrel=1
pkgdesc="emacs-clang-complete-async is an emacs extension to complete C and C++ code, it uses libclang to parse the source code on the fly and provides completion candidates to auto-complete (binary only)"
arch=(i686 x86_64)
url="https://github.com/Golevka/emacs-clang-complete-async"
license=('GPL')
depends=('clang')
provides=('clang-complete', 'emacs-clang-complete')
conflicts=('clang-complete', 'emacs-clang-complete')
install=
makedepends=('git')
optdepends=

_gitroot="https://github.com/Golevka/emacs-clang-complete-async.git"
_gitname="emacs-clang-complete-async"

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
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 clang-complete $pkgdir/usr/bin/clang-complete
}
