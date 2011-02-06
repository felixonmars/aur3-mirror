# Contributor: qwp0 <androsis@gmail.com>

pkgname=trac-multirepos-svn
pkgver=7214
pkgrel=1
pkgdesc="Trac (integrated SCM & project management) with multiple repository support"
url="http://trac.edgewall.org/wiki/MultipleRepositorySupport"
arch=('i686' 'x86_64')
license=('BSD')

conflicts=('trac')
provides=('trac')
depends=('python' 'setuptools')
makedepends=('python' 'python-genshi' 'setuptools')
source=()
md5sums=()

_svntrunk=http://svn.edgewall.com/repos/trac/sandbox/multirepos
_svnmod=trac-multirepos

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting 'python setup.py install'..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python ./setup.py install --root=$startdir/pkg || return 1

  rm -rf $startdir/src/$_svnmod-build
}
