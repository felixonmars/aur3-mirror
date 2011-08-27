# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=pyanidb-git
pkgver=20101021
pkgrel=1
pkgdesc="PyAniDB is a client for AniDB's UDP API."
arch=('any')
url="http://redmine.jvnv.net/projects/pyanidb/wiki"
license=('GPL')
depends=('python')
optdepends=('pyxattr')
makedepends=('git')
conflicts=('pyanidb')

_gitroot="git://git.jvnv.net/pyanidb"
_gitname="pyanidb"

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
