# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=cocotron-gcc-svn
pkgver=20110530
pkgrel=1
pkgdesc="GCC patched for Cocotron Obj-C runtime"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/farcaller/cocotron/wiki/Building-GCC"
provides=('cocotron-gcc')
makedepends=('subversion')


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d cocotron-gcc ]; then
		cd cocotron-gcc
		svn up
		cd $srcdir
	else
		svn checkout http://cocotron-tools-gpl3.googlecode.com/svn/trunk/gcc cocotron-gcc
	fi


  rm -rf $srcdir/build
  mkdir $srcdir/build
  cd $srcdir/build
  ../cocotron-gcc/configure --prefix=$pkgdir/opt/objc --with-gnu-as --with-gnu-ld --without-newlib --disable-multilib \
    --disable-libssp --disable-nls --disable-libobjc --enable-libffi --enable-objc-gc \
    --enable-languages=c,objc,c++,obj-c++  --enable-checking=release
  make -j2
}

package() {
  cd $srcdir/build
  make install
}
