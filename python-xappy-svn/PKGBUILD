# Maintainer: Daniel Grana <dangra@gmail.com>
pkgname=python-xappy-svn
pkgver=614
pkgrel=1
pkgdesc='A Python module providing an easy-to-use layer on top of the Xapian search engine'
arch=('i686' 'x86_64')
url='http://code.google.com/p/xappy/'
license=('GPL2')
makedepends=('subversion')
depends=('python' 'xapian-python-bindings')
conflicts=('python-xappy')
provides=('python-xappy')
source=()
_svntrunk=http://xappy.googlecode.com/svn/trunk/
_svnmod=xappy
md5sums=()

build() {
  cd $startdir/src
  msg "Connecting to $_svntrunk SVN server...."
  if [[ -d $_svnmod/.svn ]]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  cd $_svnmod
  python setup.py install --root=$startdir/pkg || return 1
}
