# Contributor: Marcel Wysocki <maci@satgnu.net>
# Maintainer: Marcel Wysocki <maci@satgnu.net>

pkgname=quake2world-client-svn
pkgver=1461
pkgrel=1
pkgdesc="A free, stand-alone, multiplayer-only iteration of Quake2"
arch=('i686' 'x86_64')
url="http://jdolan.dyndns.org/trac/wiki/Quake2World"
license=('GPL')
source=()
md5sums=()
depends=('sdl>=1.2' 'curl' 'sdl_image' 'sdl_mixer')
makedepends=('autoconf>=2.59' 'automake>=1.9.6' 'subversion')
install=quake2world.install

_svntrunk=svn://jdolan.dyndns.org/quake2world/trunk
_svnmod=quake2world-svn

build() {
  cd $srcdir

  msg "Updating SVN entries for $_svnmod..."
  svn co $_svntrunk --config-dir ./ $_svnmod  
  mkdir -p $_svnmod-build
  cp -r $_svnmod/* $_svnmod-build

  msg "SVN checkout done or server timed out."

  msg "Starting make..."

  cd $_svnmod-build
  autoreconf -i
  ./configure --prefix=/usr --without-mysql
  make || return 1
  make DESTDIR=$pkgdir install
  rm -rf ../$_svnmod-build
}
