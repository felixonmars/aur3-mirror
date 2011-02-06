# Contributor: Tim Jansson <timtux@gmail.com>

pkgname=tapioca-glib-svn
pkgver=2008
pkgrel=1
pkgdesc="Core Tapioca library, SVN version."
arch=('i686')
url="http://tapioca-voip.sourceforge.net"
license=('GPL')
depends=('dbus-glib')
makedepends=('subversion')
options=('!libtool')
source=()
md5sums=()

_svntrunk=https://tapioca-voip.svn.sourceforge.net/svnroot/tapioca-voip/trunk/tapioca-glib
_svnmod=tapioca-glib

build() {
  cd $startdir/src
  
  msg "Connecting to SVN server..."
  msg "Checking out $_svnmod"
  yes "p" | svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
 
  msg "Starting build..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
 
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  
  rm -rf $startdir/src/$_svnmod-build
}
