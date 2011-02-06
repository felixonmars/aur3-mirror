# Contributor: Liming Wang <lmwang@gmail.com> 
pkgname=python-pymc-svn
pkgver=1198
pkgrel=1
pkgdesc="Markov chain Monte Carlo for Python"
arch=('i686')
url="http://pymc.googlecode.com/"
license=('MIT')
depends=('python-numpy>=1.2.0')
optdepends=('python-scipy', 'python-matplotlib', 'python-pytables', 'ipython', 'pydot', 'python-nose')
source=()
md5sums=()

_svntrunk=http://pymc.googlecode.com/svn/trunk
_svnmod=pymc

build() {
  cd $startdir/src
  if [ -d $_svnmod/.svn ]; then
	  (cd $_svnmod && svn up)
  else
	  svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod

  python setup.py build
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
