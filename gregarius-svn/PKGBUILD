# Contributor: josephmc <josephmc@sbcglobal.net>
pkgname=gregarius-svn
provides=gregariuis
pkgver=1540     
pkgrel=1
pkgdesc="Gregarius is a web-based RSS/RDF/ATOM feed aggregator"
url="http://gregarius.net"
conflicts=('gregarius')
depends=('apache')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://svn.gregarius.net/svn/trunk/gregarius
_svnmod=gregarius

build() {
  cd $startdir/src
  # Be sure to have a ~/.subversion.  If it doesn't exist, touch it.
  touch ~/.subversion

  svn co $_svntrunk #$_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
#  cd $_svnmod
  mkdir -p $startdir/pkg/home/httpd/html/rss
  cp -r ./gregarius/* $startdir/pkg/home/httpd/html/rss
} 
