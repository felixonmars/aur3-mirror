# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=cfront
pkgver=3.0.3
pkgrel=1
pkgdesc="A C++ to C converter"
arch=('i686')
license=('BSD')
url="http://www.softwarepreservation.org/projects/c_plus_plus/index.html#cfront"
depends=('pcc' 'cpio') # pcc only needed if you set CC=pcc
source=('http://www.softwarepreservation.org/projects/c_plus_plus/cfront/release_3.0.3/source/cfront_3_0_3.tgz' 'makefile.patch')
md5sums=('6fba75b782ddcec1d8bc4b6dac8c5df9' '2e4bae47c43ccb07b1f727ed029cf3f7')

build() {
  cd $srcdir
  msg "setting up build directories"
  rm -rf $srcdir/build
  mv $srcdir/C++\ $pkgver $srcdir/build
  chmod -R 777 $srcdir/build
  cd $srcdir/build/source
  patch -p0 $srcdir/build/source/makefile -i $srcdir/makefile.patch
# CC can be changed to whatever you like
  make CC=/usr/bin/pcc
}

package() {
  cd $srcdir/build/source
  make install
}