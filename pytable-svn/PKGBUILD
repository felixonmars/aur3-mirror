pkgname=pytable-svn
pkgver=4
pkgrel=1
pkgdesc="Table implementation for Python with different encoding support."
arch=('any')
url="http://code.google.com/p/monkeys-traducoes/"
license=('GPL')
depends=('python')
makedepends=('subversion')
options=(!emptydirs)

_svntrunk=http://monkeys-traducoes.googlecode.com/svn/trunk/
_svnmod=Table

build() {
  cd "$srcdir"

  if [ -d "$_svnmod"/.svn ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  svn export "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"
  
  cd PyTable
  install -d "${pkgdir}"/usr/lib/python2.6/site-packages
  cp -r PyTable.py PyTableU.py "${pkgdir}"/usr/lib/python2.6/site-packages
}

