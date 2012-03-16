# Contributor: Marcel Wysocki <maci@satgnu.net>
# Maintainer: Marcel Wysocki <maci@satgnu.net>

pkgname=quake2world-server-svn
pkgver=1461
pkgrel=1
pkgdesc="A free, stand-alone, multiplayer-only iteration of Quake2, dedicated server."
arch=('i686' 'x86_64')
url="http://jdolan.dyndns.org/trac/wiki/Quake2World"
source=()
md5sums=()
license=('GPL')
depends=('zlib')
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
  ./configure --prefix=/usr --without-mysql --without-curl --with-tools='' --without-client
  make || return 1
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/bin/quake2world $pkgdir/usr/bin/quake2world-ded
  rm -rf ../$_svnmod-build
}
