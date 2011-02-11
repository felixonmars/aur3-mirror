# Maintainer: Kyle Sexton <ks@mocker.org>
pkgname=rmoo-git
pkgver=20110210
pkgrel=1
pkgdesc="RMOO is a MOO client for Emacs."
arch=('i686' 'x86_64')
url="https://github.com/ksexton/rmoo"
license=('unknown')
groups=()
depends=(emacs)
makedepends=('git')
provides=('emacs-rmoo')
conflicts=('emacs-rmoo')
replaces=()
backup=()
options=()
install=rmoo.install
source=()
noextract=()


_gitroot="https://github.com/ksexton/rmoo.git"
_gitname="emacs-rmoo"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure ;
  make
  install -d $pkgdir/usr/share/emacs/site-lisp/rmoo || return 1
  cp $srcdir/$_gitname-build/*.elc $pkgdir/usr/share/emacs/site-lisp/rmoo || return 1
  install -d $pkgdir/usr/share/doc/rmoo || return 1
  cp $srcdir/$_gitname-build/LICENSE $srcdir/$_gitname-build/README $srcdir/$_gitname-build/README.html $pkgdir/usr/share/doc/rmoo || return 1
}
