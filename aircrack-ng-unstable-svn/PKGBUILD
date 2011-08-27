# contributor: nofxx <x@nofxx.com>
# modifier: x-demon <x-demon{at}x-demon.org
pkgname=aircrack-ng-unstable-svn
pkgver=1583
pkgrel=1
pkgdesc="Wifi security suite - WEP / WPA crack tools -- with SQLite3 and unstable (read experimental) tools"
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPL2')
depends=('openssl' 'sqlite3' 'wireless_tools' 'autoconf' 'libtool')
makedepends=('subversion')
provides=('aircrack-ng' 'aircrack-ng-svn')
#replaces=('aircrack-ng-svn')
conflicts=('aircrack-ng')
source=()
md5sums=() 

_svntrunk="http://trac.aircrack-ng.org/svn/trunk"
_svnmod=aircrack

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build
  #
  # BUILD
  #
  make SQLITE=true UNSTABLE=true || return 1
  make prefix=/usr SQLITE=true UNSTABLE=true DESTDIR=$startdir/pkg/ install
}
