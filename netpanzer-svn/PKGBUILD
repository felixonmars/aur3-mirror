# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=netpanzer-svn
pkgver=1078
pkgrel=1
pkgdesc="An Online Multiplayer Tactical Warfare Game"
url="http://netpanzer.berlios.de/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('physfs' 'sdl_mixer' 'sdl_image')
makedepends=('ftjam' 'subversion')
provides=('netpanzer')
conflicts=('netpanzer')
source=()
md5sums=()

_svntrunk=http://svn.berlios.de/svnroot/repos/netpanzer/trunk/netpanzer/
_svnmod=netpanzer

build() {

  #Grab the sources with svn
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  rm -r $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build
  
  #Build and install the package
  sh autogen.sh
  ./configure --prefix=/usr --disable-debug 
  sh jamconfig
  jam || return 1
  jam -sprefix=$pkgdir/usr install || return 1
  
}

# vim:set ts=2 sw=2 et:
