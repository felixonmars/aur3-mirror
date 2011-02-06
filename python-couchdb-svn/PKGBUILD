# Contributor: palbo <palbof@gmail.com>

pkgname=python-couchdb-svn
pkgver=147
pkgrel=1
pkgdesc="Python library for working with CouchDB"
url="http://code.google.com/p/couchdb-python/"
license=(bsd)
arch=(i686)
depends=('python>=2.6' 'httplib2' 'couchdb')
makedepends=('subversion')
conflicts=()
provides=('python-couchdb')

source=()
md5sums=()

_svntrunk=http://couchdb-python.googlecode.com/svn/trunk/
_svnmod=python-couchdb

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod
  python setup.py install --root=$startdir/pkg

  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
# vim:syntax=sh
