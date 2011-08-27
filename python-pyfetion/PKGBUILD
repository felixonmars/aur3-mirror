# Contributor: tocer <tocer.deng@gmail.com>
pkgname=python-pyfetion
_realname=PyFetion
pkgver=88
pkgrel=1
pkgdesc="a python lib for China Mobile Fetion Protocol"
arch=("any")
url="http://code.google.com/p/pytool/"
license=('MIT')
depends=()
makedepends=('subversion')
install=
source=(setup.py)
_svntrunk=http://pytool.googlecode.com/svn/trunk/
_svnmod=pytool
md5sums=('11bc694bf843300dc1e1378b29d5ed36')

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
  cp "$startdir/setup.py" "$srcdir/$_svnmod-build/$_realname/"
  cd "$srcdir/$_svnmod-build/$_realname"

  python setup.py install --root=$startdir/pkg/
}
