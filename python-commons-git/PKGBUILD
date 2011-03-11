# Maintainer: David Gidwani <david.gidwani@gmail.com>
pkgname=python-commons-git
pkgver=20110311
pkgrel=1
pkgdesc="A language agnostic set of libraries designed to supplement the \
standard library of the target language."
arch=('i686' 'x86_64')
url="http://dave.uni.cx/project/commons"
license=('GPL')
optdepends=('python-imaging: commons.core.graphics features')
makedepends=('python2' 'git')
provides=('commons')

_gitroot="git://github.com/darvid/commons-python.git"
_gitname="commons-python"

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
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
