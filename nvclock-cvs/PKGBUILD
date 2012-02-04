# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=nvclock-cvs
pkgver=20100921
pkgrel=1
pkgdesc="A small utility which allows users to overclock NVIDIA based video cards"
url="http://www.linuxhardware.org/nvclock/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
makedepends=('cvs')
provides=('nvclock')
conflicts=('nvclock')
source=()
md5sums=()
options=('!makeflags')

_cvsroot=":pserver:anonymous@nvclock.cvs.sourceforge.net:/cvsroot/nvclock"
_cvsmod="nvclock"

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


  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
#category: system
