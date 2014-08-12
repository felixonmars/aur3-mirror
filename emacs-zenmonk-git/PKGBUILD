# Contributor: listx <linusarver <at> gmail <dot> com>
pkgname=emacs-zenmonk-git
pkgver=20140811
pkgrel=1
_gitname="zenmonk"
_gitbranch="master"
_gitroot="https://github.com/listx/zenmonk.git"
pkgdesc="Zenmonk color theme for emacs"
arch=('any')
url="https://github.com/listx/zenmonk"
depends=('emacs')
makedepends=('git')
license=('GPLv3')
provides=('emacs-zenmonk')
conflicts=('emacs-zenmonk')
install=$pkgname.install

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
  # create destination paths
  install -d $pkgdir/usr/share/emacs/site-lisp/$_gitname
  install -d $pkgdir/usr/share/doc/emacs-$_gitname

  # install contents to paths
  install -m644 $startdir/src/$_gitname/*.el* $pkgdir/usr/share/emacs/site-lisp/$_gitname
}
