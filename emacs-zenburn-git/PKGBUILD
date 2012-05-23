# Contributor: listdata <linusarver <at> gmail <dot> com>
pkgname=emacs-zenburn-git
pkgver=20120523
pkgrel=1
_gitname="zenburn-el"
_gitroot="git://github.com/dbrock/zenburn-el.git"
pkgdesc="The zenburn color theme for GNU Emacs"
arch=('any')
url="https://github.com/dbrock/zenburn-el"
depends=(emacs emacs-color-theme)
makedepends=('git')
license=('GPL')
provides=('emacs-zenburn')
conflicts=('emacs-zenburn')
install=$pkgname.install

build() {
  # create persistent build directory
  mkdir -p $startdir/src

  cd $startdir/src

  if [[ -d $_gitname ]]; then
    cd $_gitname
    git clean -dxf
    git reset --hard
    msg "Pulling from GIT server..."
    git pull origin
  else
    git clone --depth 1 $_gitroot $_gitname
    cd $_gitname
  fi
}

package() {
  # create destination path
  install -d $pkgdir/usr/share/emacs/site-lisp/$_gitname
  # copy over files into path
  cp $startdir/src/$_gitname/zenburn.el $pkgdir/usr/share/emacs/site-lisp/$_gitname
}
