# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>
# Contributor: Philip Müller <mail at philip.in-aachen dot net>
pkgname=emacs-sass-mode-git
pkgver=20130111
pkgrel=1
pkgdesc="An emacs mode for editing SASS code"
arch=('any')
url="http://sass-lang.com/"
license=('MIT')
makedepends=('git')
provides=(emacs-sass-mode)
conflicts=(emacs-sass-mode)
install=$pkgname.install

_gitname="sass-mode"
_gitroot="git://github.com/nex3/$_gitname.git"
_gitbranch="master"

build() {
  # create persistent build directory
  mkdir -p $startdir/src

  cd $startdir/src # $srcdir is an absolute path for convenience

  # checkout the latest GIT source code
  if [[ -d $_gitname ]]; then
    cd $_gitname
    msg "Sanitizing work tree..."
    git checkout $_gitbranch
    git clean -dxf # remove all untracked files (this should be even more robust than running `make clean')
    git reset --hard # discard all changes to tracked files (if they had been tampered with somehow)
    msg "Pulling from official repo $_gitroot ..."
    git pull origin # get latest changes
  else
    git clone --depth 1 $_gitroot $_gitname
    cd $_gitname
  fi
}

package() {
  # create destination path
  install -d $pkgdir/usr/share/emacs/site-lisp/$_gitname
  # copy over files into path
  cp $startdir/src/$_gitname/*.el* $pkgdir/usr/share/emacs/site-lisp/$_gitname
}