# Maintainer: BeholdMyGlory <larvid@gmail.com>

pkgname=python3-genshi-svn
pkgver=1177
pkgrel=1
pkgdesc="Python toolkit for stream-based generation of output for the web."
url="http://genshi.edgewall.org/"
license=("BSD")
arch=('any')
depends=('python')
makedepends=('python-distribute' 'subversion')

_svntrunk=http://svn.edgewall.org/repos/genshi/trunk
_svnmod=genshi

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

  python setup.py install --root=$pkgdir
  install -D -m0644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
