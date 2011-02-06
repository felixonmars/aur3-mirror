# Maintainer: dante4d <dante4d at gmail dot com>
pkgname=codecgraph-git
pkgver=20100509
pkgrel=1
pkgdesc="A tool to generate a graph based on the ALSA description of a HDA codec, GIT version."
arch=('i686' 'x86_64')
url="http://helllabs.org/codecgraph/"
license=('GPL')
depends=('graphviz')
makedepends=('git')
provides=('codecgraph')
conflicts=('codecgraph')

_gitroot="http://helllabs.org/git/codecgraph.git"
_gitname="codecgraph"

build() {
  cd $startdir/src
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/$_gitname-build 2&> /dev/null
  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  env PREFIX=/usr make DESTDIR=$startdir/pkg install -e || return 1
}

