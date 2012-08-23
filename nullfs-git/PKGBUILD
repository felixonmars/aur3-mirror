# Contributor: listdata <linusarver <at> gmail <dot> com>
pkgname=nullfs-git
pkgver=20120823
pkgrel=1
_gitname="nullfs"
_gitnamebranch="master"
_gitroot="https://github.com/xrgtn/$_gitname"
pkgdesc="FUSE nullfs drivers"
arch=('any')
url="https://github.com/xrgtn/$_gitname"
depends=('fuse')
makedepends=('git')
license=('GPL')
provides=('nullfs')
conflicts=('nullfs')
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
    git pull --rebase
  else
    git clone --depth 1 $_gitroot $_gitbranch
    cd $_gitname
    git pull --rebase
    git checkout $_gitbranch
  fi

  # compile the three flavors of nullfs

  # nul1fs
  make nul1fs
  # nullfs
  g++ -lfuse -o nullfs nullfs.c++
  # nulnfs
  gcc -lfuse -o nulnfs nulnfs.c
}

package() {
  # create destination paths
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/$_gitname
  # copy over files into paths
  cp $startdir/src/$_gitname/README $pkgdir/usr/share/$_gitname
  cp $startdir/src/$_gitname/{nul1fs,nullfs,nulnfs} $pkgdir/usr/bin
}
