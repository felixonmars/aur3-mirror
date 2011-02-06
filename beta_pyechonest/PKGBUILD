# Contributor: Adrian Carpenter <adriatic.c@gmail.com>
pkgname=beta_pyechonest
pkgver=118
pkgrel=1
pkgdesc="beta version 4 of pyechonest for interacting with echonest"
arch=('i686' 'x86_64')
url="http://pyechonest.googlecode.com/svn/branches/beta_pyechonest"
license=('BSD')
depends=('python>=2.5' 'python<3.0' 'python-simplejson')
conflicts=('pyechonest')
makedepends=('subversion')
source=()
md5sums=() 

_svntrunk=http://pyechonest.googlecode.com/svn/branches/beta_pyechonest
_svnmod=beta_pyechonest

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  python setup.py install --root=$pkgdir/
}
# vim:set ts=2 sw=2 et:
