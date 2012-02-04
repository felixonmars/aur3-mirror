# Contributor: Tim Jansson <timtux@gmail.com>
pkgname=fama-im-svn
pkgver=54
pkgrel=1
pkgdesc="Fama-IM is a text based IM client, SVN version."
arch=('i686')
url="http://fama-im.org/"
license=('GPL')
depends=('ncurses' 'telepathy-gabble' \
	'telepathy-butterfly' 'tapioca-glib-svn')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://svn.fama-im.org/trunk
_svnmod=fama-im

build() {
  cd $startdir/src
  
  mkdir -p ~/.subversion; touch ~/.subversion/servers
  msg "Connecting to SVN server..."
  msg "Checking out $_svnmod"
  yes "p" | svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  
  msg "Starting build..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  ./waf
  ./waf configure --prefix=/usr
  ./waf build || return 1 
  ./waf install --destdir=$startdir/pkg || return 1
}
