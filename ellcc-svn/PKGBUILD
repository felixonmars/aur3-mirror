# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=ellcc-svn
_realname=ellcc
pkgver=1
pkgrel=1
pkgdesc="An embedded cross compiler infrastructure based on LLVM/Clang, Qemu, gdb, binutils"
url="http://ellcc.org/"
arch=('i686' 'x86_64')
license=('BSD' 'GPL')
depends=('clang')
makedepends=('subversion')
options=(!emptydirs)

_svntrunk=http://ellcc.org/svn/ellcc/trunk
_svnmod=${_realname}

build() {

  cd ${srcdir}

  if [ -d $_svnmod ] ; then
    (cd $_svnmod && svn update)
    msg "The local files are updated."
  else
    svn co ${_svntrunk} ${_svnmod}
  fi

  rm -rf $srcdir/build # starting fresh...
  cp -ar $srcdir/$_svnmod $srcdir/build
  
  cd $srcdir/build
  #placeholder: test for ecc and e++ and use them if installed - self hosting.
  export CC=clang
  export CXX=clang++
  #
    
  ./configure --prefix=/usr/ellcc
  make
}

package() {
  cd $srcdir/build
  mkdir -p $pkgdir/usr/ellcc/bin
  make DESTDIR=$pkgdir
}
