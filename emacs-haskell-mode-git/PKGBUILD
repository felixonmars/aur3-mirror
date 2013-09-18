# Contributor: listx <linusarver <at> gmail <dot> com>
pkgname=emacs-haskell-mode-git
pkgver=20120523
pkgrel=1
_gitname="haskell-mode"
_gitnamebranch="haskell-mode"
_gitroot="git://github.com/haskell/$_gitname"
pkgdesc="Haskell syntax highlighting, etc. for GNU Emacs"
arch=('any')
url="https://github.com/haskell/$_gitname"
depends=('emacs')
makedepends=('git')
license=('GPL')
provides=('emacs-haskell-mode')
conflicts=('emacs-haskell-mode')
install=$pkgname.install

build() {
  # create persistent build directory
  mkdir -p $startdir/src

  cd $startdir/src

  if [[ -d $_gitnamebranch ]]; then
    cd $_gitnamebranch
    git clean -dxf
    git reset --hard
    msg "Pulling from GIT server..."
    git pull --rebase
  else
    git clone --depth 1 $_gitroot $_gitnamebranch
    cd $_gitnamebranch
    git pull --rebase
  fi

  # generate the haskell-mode-autoloads.el file and also execute byte compilation
  make all
}

package() {
  # create destination path
  install -d $pkgdir/usr/share/emacs/site-lisp/$_gitnamebranch
  # copy over all files into path
  cp -r $startdir/src/$_gitnamebranch/* $pkgdir/usr/share/emacs/site-lisp/$_gitnamebranch
}
