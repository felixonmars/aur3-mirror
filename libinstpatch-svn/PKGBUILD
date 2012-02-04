# Contributor: Peter Baldwin <bald_pete@hotmail.com>
pkgname=libinstpatch-svn
pkgver=231
pkgrel=1
pkgdesc="A library which handles instrument editing and also contains a reference implementation of CRAM for instrument compression."
url="http://swami.resonance.org/trac/wiki/libInstPatch"
license=('GPL')
arch=('i686')
depends=('glib2' 'audiofile' 'zlib')
conflicts=('libinstpatch')
provides=('libinstpatch')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=https://swami.svn.sourceforge.net/svnroot/swami/trunk
_svnmod=libinstpatch

build() {
  cd $startdir/src
  svn export $_svntrunk/$_svnmod
  cd $_svnmod

  ./autogen.sh

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
