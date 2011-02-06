#Contributor: Feng Wang  <wanng dot fenng at gmail dot com>
pkgname=mpfrcpp-cvs
pkgver=20100418
pkgrel=1
pkgdesc="MPFRCPP is free object-oriented interface to the MPFR library written in C++."
url="http://beshenov.ru/mpfrcpp"
license=('GPL v3')
depends=('gcc' 'glibc' 'mpfr' 'gmp' )
makedepends=('cvs' 'mpfr' 'gcc' 'gmp')
arch=( 'i686' 'x86_64' )

_cvsroot=":pserver:anonymous:@cvs.sv.gnu.org:/sources/mpfrcpp"
_cvsmod="mpfrcpp"

build() {
  cd $startdir/src
  msg "Connecting to cvs.sv.gnu.org CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $_cvsmod
  #./autogen.sh

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build

  #./configure --prefix=/usr
  #make || return 1
  #make DESTDIR=$startdir/pkg install || return 1

  $CXX src/mpfrcpp/initialization/*.cpp -c -pedantic -std=c++98 $CFLAGS || return 1
  $CXX src/mpfrcpp/initialization/*.cpp -o libmpfrcpp.so -shared -fPIC -pedantic -std=c++98 $CFLAGS || return 1
  ar cru libmpfrcpp.a *.o  || return 1

  mkdir -p $startdir/pkg/usr/lib
  cp *.a $startdir/pkg/usr/lib
  cp *.so $startdir/pkg/usr/lib

  mkdir -p $startdir/pkg/usr/include/mpfrcpp
  rm -r src/mpfrcpp/CVS 
  rm src/mpfrcpp/Makefile 
  rm src/mpfrcpp/README 
  cp -r src/mpfrcpp/* $startdir/pkg/usr/include/mpfrcpp

  mkdir -p $startdir/pkg/usr/include/mpfrcpp/nacre
  cp -r src/nacre/* $startdir/pkg/usr/include/mpfrcpp/nacre

  mkdir -p $startdir/pkg/usr/share/doc/mpfrcpp
  cp -r doc/* $startdir/pkg/usr/share/doc/mpfrcpp
}

