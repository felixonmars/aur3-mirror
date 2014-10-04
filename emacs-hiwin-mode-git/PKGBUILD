# Contributor: listx <linusarver <at> gmail <dot> com>
pkgname=emacs-hiwin-mode-git
pkgver=20141003
pkgrel=1
_gitname="hiwin-mode"
_gitbranch="master"
_gitroot="https://github.com/yoshida-mediba/hiwin-mode.git"
pkgdesc="Change background color of inactive Emacs windows (inactive 'panes' in a single Emacs 'frame')."
arch=('any')
url="https://github.com/yoshida-mediba/hiwin-mode"
depends=('emacs')
makedepends=('git')
license=('GPLv3')
provides=('emacs-hiwin-mode')
conflicts=('emacs-hiwin-mode')
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
  install -m644 $startdir/src/$_gitname/README.md $pkgdir/usr/share/doc/emacs-$_gitname
}
