# Maintainer: Ben Davis <ben@bendavisdigital.com>

pkgname=fsqlf-git
pkgver=20140821
pkgrel=1
pkgdesc="Free SQL Formatter"
arch=(any)
license=('GPL')
url="http://fsqlf.sourceforge.net/"
depends=()
makedepends=('git')
md5sums=('SKIP')
install=fsqlf.install
# TODO change to master once make_install PR is merged
_gitroot="http://github.com/bendavis78/fsqlf.git"
_gitbranch=make_install
_gitname="fsqlf"

build () {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone -b $_gitbranch --depth=1 $_gitroot $_gitname
  fi

  cd $_gitname
  make clean
  make EXEC_GUI= all || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make EXEC_GUI= PREFIX=$pkgdir/usr install || return 1
}
