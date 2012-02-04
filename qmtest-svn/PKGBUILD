# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=qmtest-svn
pkgver=1074
pkgrel=1
pkgdesc="Cost-effective general purpose testing solution"
arch=('i686' 'x86_64')
url="http://www.codesourcery.com/qmtest"
license=('GPL')
depends=('python')
provides=('qmtest')
conflicts=('qmtest')
source=()
md5sums=()

_svntrunk=svn://source.codesourcery.com/qmtest/trunk
_svnmod=qmtest

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

  python setup.py install --root=$startdir/pkg
}
