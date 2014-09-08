# Contributor: listx <linusarver <at> gmail <dot> com>
pkgname=cabal2pkgbuild-git
pkgver=20140127
pkgrel=1
_gitname="cabal2pkgbuild"
_gitbranch="master"
_gitroot="git://github.com/listx/cabal2pkgbuild.git"
pkgdesc="A cblrepo wrapper for generating PKGBUILD files from Hackage packages."
arch=('any')
url="http://listx.github.io/code.html#cabal2pkgbuild"
depends=('cblrepo' 'aria2' 'coreutils' 'grep' 'pacman' 'sed' 'zsh')
makedepends=('git')
license=('BSD')
provides=('cabal2pkgbuild')
conflicts=('cabal2pkgbuild')

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
  # create all paths that will be used by this packages
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/licenses/$_gitname
  install -d $pkgdir/usr/share/doc/$_gitname

  # install content into paths
  cd $startdir/src/$_gitname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$_gitname
  install -m644 README.md $pkgdir/usr/share/doc/$_gitname
  install -m755 $_gitname.sh $pkgdir/usr/bin/$_gitname
}
