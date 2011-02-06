# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=multihash-git
pkgver=20091224
pkgrel=1
pkgdesc="Multi-hashing library for Python."
arch=('i686' 'x86_64')
url="http://trac.jvnv.net/wiki/multihash"
license=('GPL')
depends=('python' 'boost')
makedepends=('git')
provides=('multihash')

_gitroot="git://git.jvnv.net/multihash"
_gitname="multihash"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python setup.py install --root=${pkgdir} || return 1
} 
