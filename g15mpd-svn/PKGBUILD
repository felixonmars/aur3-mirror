# Contributor: Swen Simon <swsimon at gmail dot com>

pkgname=g15mpd-svn
pkgver=320
pkgrel=1
pkgdesc="MPD plugin for g15daemon"
arch=('i686')
url="http://www.g15tools.com"
license="GPL"
depends=('g15daemon' 'autoconf' 'automake' 'libtool' 'libmpd' 'mpd')
makedepends=('subversion')
source=()
md5sums=()

_svnmod="g15mpd"
_svntrunk="https://g15daemon.svn.sourceforge.net/svnroot/g15daemon/trunk/g15daemon-audio-plugins/g15mpd"

build() {
  cd $startdir/src
  msg "Connecting to $_svnmod.sourceforge.net SVN server...."
  svn co $_svntrunk $_svnmod -r $pkgver 

  [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1

  mkdir -p $startdir/pkg/usr/bin
  make DESTDIR=${startdir}/pkg install

  # remove junk files
  find $startdir/pkg/ -name ".svn" -type d -exec rm -rf {} +
  rm -rf $startdir/pkg/usr/share
}
