# Maintainer: Yaşar Arabacı <yasar11732@gmail.com>
pkgname=packgraph
pkgver=20120108
pkgrel=1
pkgdesc="packgraph is package manager activity graphing tool"
arch=('i686' 'x86_64')
url="https://github.com/yasar11732/packgraph"
license=('GPLv3')
depends=('python2-matplotlib')
makedepends=('python2' 'git')

_gitroot="git://github.com/yasar11732/packgraph.git"
_gitname="packgraph"

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
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root=$pkgdir/ --optimize=1
} 