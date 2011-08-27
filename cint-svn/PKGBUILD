# Maintainer: Dhruv Desai <svenskaparadox [at] gmail [dot] com>
# Contributor: Niklas Schmuecker (IRC: nisc) <nschmuecker (gmail)>

pkgname=cint-svn
pkgver=38290
pkgrel=1
pkgdesc="The CINT C++ interpreter."
url="http://root.cern.ch/drupal/content/cint"
arch=('i686')
depends=('gcc-libs')
license=('X11/MIT')
options=('!libtool')
makedepends=('subversion')

_svnmod="cint"
_svntrunk="http://root.cern.ch/svn/root/trunk/cint"

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
  
  ./configure --prefix=/usr --arch=linux || return 1
  make -j2 || return 1
  make DESTDIR=$startdir/pkg/ install || return 1
}

