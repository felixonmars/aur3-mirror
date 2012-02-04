# Contributor: tocer <tocer.deng@gmail.com>
pkgname=clifetion
pkgver=88
pkgrel=1
pkgdesc="a fetion client with Chinese command line interface"
arch=("any")
url="http://code.google.com/p/pytool/"
license=('MIT')
depends=(python-pyfetion)
makedepends=('subversion')
_svntrunk=http://pytool.googlecode.com/svn/trunk/
_svnmod=pytool
_realsvnmod=PyFetion
md5sums=()

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir -p $startdir/pkg/usr/bin
  install -m 755 "$srcdir/$_svnmod/$_realsvnmod/fetion.py" $startdir/pkg/usr/bin/clifetion
}
