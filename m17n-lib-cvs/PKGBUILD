# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=m17n-lib-cvs
pkgver=20110409
pkgrel=1
pkgdesc="library for mulitilingualization - library"
arch=('i686' 'x86_64')
url="http://www.m17n.org/libotf/"
depends=('sh' 'fribidi' 'libxml2' 'libthai' 'gd' 'libxft' 'libotf-cvs')
makedepends=('cvs')
conflicts=('m17n-lib')
provides=('m17n-lib')
options=('emptydirs' '!libtool')
license=('GPL')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.m17n.org:/cvs/m17n"
_cvsmod="m17n-lib"

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

  ./bootstrap.sh 
  ./configure --prefix=/usr 
  make 
}
package() {
  cd $srcdir/$_cvsmod-build
  make DESTDIR=$pkgdir install 
}
