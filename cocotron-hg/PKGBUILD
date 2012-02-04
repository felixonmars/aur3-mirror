# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=cocotron-hg
pkgver=20110614
pkgrel=1
pkgdesc="A cross platform implementation of the Apple Cocoa API."
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.cocotron.org/"
#For current info: http://groups.google.com/group/cocotron-dev/
#https://github.com/farcaller/cocotron/wiki/Building-Cocotron
depends=('cocotron-gcc' 'cmake')
makedepends=('mercurial')


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d cocotron ]; then
		cd cocotron
		hg pull -u
		cd $srcdir
	else
		hg clone https://cocotron.googlecode.com/hg/ cocotron
	fi
  rm -rf $srcdir/cocotron/build # start fresh
  mkdir $srcdir/cocotron/build
  cd $srcdir/cocotron/build
  cmake -DCMAKE_C_COMPILER=/opt/objc/bin/gcc \
	-DCMAKE_CXX_COMPILER=/opt/objc/bin/g++ \
	-DCMAKE_INSTALL_PREFIX=$pkgdir/opt/objc ..
  make
}

package() {
  cd $srcdir/cocotron/build/
  make install
}