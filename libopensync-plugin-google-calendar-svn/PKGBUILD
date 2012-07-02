# Contributor: Nicolas Quienot <niQo>
pkgname=libopensync-plugin-google-calendar-svn
pkgver=6127
pkgrel=1
pkgdesc="Google Calendar plugin for OpenSync"
url="http://www.opensync.org/"
arch=('i686' 'x86_64' 'arm')
makedepends=('cmake' 'subversion')
options=('!libtool')
depends=('libopensync-svn' 'libgcal')
conflicts=('libopensync-plugin-gcalendar' 'libopensync-plugin-google-calendar')
replaces=('libopensync-plugin-gcalendar' 'libopensync-plugin-google-calendar')
license=('GPL')
source=()
md5sums=()

_svnmod="libopensync-plugin-google-calendar"
_svntrunk="http://svn.opensync.org/plugins/google-calendar"

build()
{
  cd $startdir/src
  msg "Connecting to $_svntrunk SVN server...."
  svn co $_svntrunk $_svnmod -r $pkgver

  [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm  -rf  $startdir/src/$_svnmod-build
}

