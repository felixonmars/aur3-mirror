# Contributor: Sebastian Krämer <basti.kr@gmail.com>

pkgname=python2-pysvg-svn
provides=('python2-pysvg')
pkgver=30
pkgrel=1
pkgdesc="A pure python library to create SVG documents."
url="http://codeboje.de/pysvg/"
source=()
md5sums=()
arch=('i686')
license=('BSD')
depends=('python2')
makedepends=('subversion')

_svnmod="pysvg-read-only"
_svntrunk="http://pysvg.googlecode.com/svn/trunk"

build() {
  cd $startdir/src

  msg "Getting sources..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
    pwd
  else
    svn co $_svntrunk -r $pkgver $_svnmod
    cd $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting setup.py..."

  cd pySVG
  python2 setup.py install --prefix=$startdir/pkg/usr
}
