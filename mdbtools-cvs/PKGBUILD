# Contributor:  Ted To <rainexpected@gmail.com>

pkgname=mdbtools-cvs
pkgver=20100324
pkgrel=1
pkgdesc=" A set of libraries and utilities for reading Microsoft Access database (MDB) files."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mdbtools/"
makedepends=('cvs')
provides=('mdbtools')
conflicts=('mdbtools')
license=('GPL')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@mdbtools.cvs.sourceforge.net:/cvsroot/mdbtools"
_cvsmod="mdbtools"

build() {
  cd $srcdir
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -f $_cvsmod
    cd $_cvsmod
  fi
  
  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  ./autogen.sh
  ./configure --prefix=/usr --enable-sql
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
