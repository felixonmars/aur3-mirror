# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname='python2-cvxpy-svn'
pkgver=r66
pkgrel=2
pkgdesc='Modeling convex optimization problems in Python'
url='http://www.stanford.edu/~ttinoco/cvxpy/'
arch=('any')
license=('GPL3')
depends=('python2' 'python2-cvxopt' 'python2-numpy' 'python2-scipy')
makedepends=('subversion' 'python2-setuptools')
source=()

_svntrunk=http://cvxpy.googlecode.com/svn/trunk
_svnmod=cvxpy-read-only

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  python2 setup.py build
}

package() {
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root=$pkgdir
}
