pkgname=qpxtool-cvs
pkgver=20091230
pkgrel=1
pkgdesc="Open Source Solution which intends to give you access to all available Quality Checks"
arch=('i686' 'x86_64')
url="http://qpxtool.sourceforge.net/"
license=('GPL')
depends=('qt')
makedepends=('cvs')
source=()
md5sums=()


_cvsroot=":pserver:anonymous@qpxtool.cvs.sourceforge.net:/cvsroot/qpxtool"
_cvsmod="qpxtool"


build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  ./configure --prefix=/usr
  make cli || return 1
  make gui || return 1
  make DESTDIR=$pkgdir cli_install || return 1
  make DESTDIR=$pkgdir gui_install || return 1
}