# Contributor: Alexey 'l1feh4ck3r' Antonov <1ifeh4ck3r at gmail dot com>

pkgname=libtorrent-rc
_pkgname=libtorrent
pkgver=0.15
pkgrel=1
pkgdesc="BitTorrent library written in C++"
arch=('i686' 'x86_64')
url="http://libtorrent.rakshasa.no"
license=('GPL')
depends=('libsigc++2.0' 'openssl')
makedepends=('subversion')
conflicts=('libtorrent')
provides=('libtorrent')
source=()
md5sums=()

_svnmod="libtorrent"
_svnrc="http://libtorrent.svn.sourceforge.net/svnroot/libtorrent/branches/RC_0_15"

build() {
  cd $startdir/src
  msg "Connecting to $_svnmod SVN server...."
  svn co $_svnrc $_svnmod

  msg "SVN checkout done or server timeout"
  cd $_svnmod

  msg "Starting make..."
  pwd
  ./autogen.sh
  ./configure --prefix=/usr --disable-debug

  make || return 1

  mkdir -p $startdir/pkg/usr/bin
  make DESTDIR=${startdir}/pkg install
}
