# Maintainer: Marcel Schneider <marcel@coopmasters.de>
pkgname=mingw32-xlslib
_DOWNLOADNAME=xlslib
pkgver=2.3.4
pkgrel=1
pkgdesc="A C/C++ multi-platform library for dynamically generating Excel(TM) files (mingw32)"
arch=('any')
url="http://xlslib.sourceforge.net/"
license=('LGPL')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=('!strip' '!buildflags' '!libtool')
install=
source=(http://downloads.sourceforge.net/project/xlslib/$_DOWNLOADNAME-${pkgver}.zip)
md5sums=('ddb5f88518080eccc3fe527cd4ca4853')

build() {
  cd "$srcdir/$_DOWNLOADNAME"
  unset LDFLAGS
  unset CXXFLAGS
  unset CFLAGS
  export CXX=i486-mingw32-g++
  export CC=i486-mingw32-gcc

  sed -ie "/AX_CC_PRAGMA_PACK/d" configure.ac
  sed -ie "s/^#error/#warning/" src/common/xls_pshpack1.h
  sed -ie "s/^#error/#warning/" src/common/xls_pshpack2.h
  sed -ie "s/^#error/#warning/" src/common/xls_poppack.h
  sed -ie "s/^#error/#warning/" src/common/xls_pshpack4.h

  bash bootstrap
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --build=i686-linux
  make || return 1
   
  
}
package(){
  cd "$srcdir/$_DOWNLOADNAME"
  
  make  DESTDIR=$pkgdir install
  install  $srcdir/$_DOWNLOADNAME/src/common/xlstypes.h $pkgdir/usr/i486-mingw32/include/xlslib  || exit 1
 
}

