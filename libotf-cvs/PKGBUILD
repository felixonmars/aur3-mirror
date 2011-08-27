# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=libotf-cvs
pkgver=20110409
pkgrel=1
pkgdesc="Library for handling OpenType fonts - cvs version"
arch=('i686' 'x86_64')
depends=('freetype2' 'libxaw' 'sh')
conflicts=('libotf')
provides=('libotf')
makedepends=('cvs')
url="http://www.m17n.org/libotf/"
license=('GPL')
options=(!libtool)
source=()
md5sums=()
#generate with 'makepkg -g'

_cvsroot=":pserver:anonymous@cvs.m17n.org:/cvs/m17n"
_cvsmod="libotf"

build() {
  cd $srcdir
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  [ -d $srcdir/$_cvsmod-build ] && rm -r $srcdir/$_cvsmod-build
  cp -r $srcdir/$_cvsmod $srcdir/$_cvsmod-build
  cd $srcdir/$_cvsmod-build

  #
  # BUILD HERE
  #

  ./autogen.sh 
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$_cvsmod-build
  make DESTDIR=$pkgdir install
}
