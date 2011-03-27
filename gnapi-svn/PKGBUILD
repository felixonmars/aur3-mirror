# Contributor: Wieslaw Spyra <wmmsato2dotpl>

pkgname=gnapi-svn
pkgver=61
pkgrel=1
pkgdesc="Subtitles downloader from napiprojekt.pl and opensubtitles databases"
url="http://gnapi.sourceforge.net"
license="GPL"
depends=(gtk2 libnotify libsoup libxml2 ffmpeg p7zip gconf gnome-vfs nautilus)
makedepends=(make pkgconfig subversion)
provides=('gnapi')
conflicts=('gnapi')
source=()
md5sums=()
arch=('i686' 'x86_64')

_svntrunk="https://gnapi.svn.sourceforge.net/svnroot/gnapi"
_svnmod="gnapi"

build() {
  cd ${srcdir}
  msg "Connecting to SVN server...."
  if [ -d ${_svnmod}/.svn ]; then
  (cd ${_svnmod} && svn up -r $pkgver)
  else
  svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  svn export ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install

  rm -rf ${srcdir}/${_svnmod}-build
}


