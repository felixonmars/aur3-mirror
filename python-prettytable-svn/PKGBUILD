pkgname=python-prettytable-svn
pkgver=65
pkgrel=1
pkgdesc="A simple Python library for easily displaying tabular data in a visually appealing ASCII table format"
url="http://pypi.python.org/pypi/PrettyTable"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python')
makedepends=('python-distribute' 'subversion')
provides=('python-prettytable')
conflicts=('python-prettytable')
replaces=('python-prettytable')
md5sums=()

_svntrunk=http://prettytable.googlecode.com/svn/trunk/
_svnmod=prettytable

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #

  python setup.py build
}
package() {
  cd "$srcdir/$_svnmod-build"
  python setup.py install --prefix=/usr --root=$startdir/pkg
}
