# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=python2-opensearch
pkgver=20110422
pkgrel=1
pkgdesc="a python opensearch client"
arch=(any)
url="https://github.com/edsu/opensearch"
license=('GPL')
depends=('python2')
makedepends=('git')
optdepends=()
provides=('python2-opensearch')
conflicts=('python2-opensearch')
source=()
md5sums=()

_gitroot="git://github.com/edsu/opensearch.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Running setup.py..."
  python2 ./setup.py install --root=$pkgdir
} 

