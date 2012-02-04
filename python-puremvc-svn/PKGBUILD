# Contributor: Sebastian Krämer <basti.kr@gmail.com>

pkgname=python-puremvc-svn
provides=('python-puremvc')
pkgver=95
pkgrel=1
pkgdesc="A lightwight framework for creating applications based upon the classic MVC concept."
url="http://puremvc.org/"
source=()
md5sums=()
arch=('i686')
license=('cc-by-3.0')
depends=('python')
makedepends=('subversion')

_svnmod="puremvc"
_svntrunk="http://svn.puremvc.org/PureMVC_Python/trunk"

build() {
  cd $startdir/src

  msg "Getting sources..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver $_svnmod
    cd $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting setup.py..."

  python setup.py install --prefix=$startdir/pkg/usr 
}
