# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=tack-hg
pkgver=6
pkgrel=1
pkgdesc="The Amsterdam Compiler Kit: a small compiler for various languages"
arch=('i686')
license=('BSD')
url="http://tack.sourceforge.net/"
depends=('gcc')
makedepends=('mercurial')
source=('configpm.patch')
md5sums=('b719e1f0b5d28dfcd0200e103b157122')

build() {
  export LC_ALL=C
  cd $srcdir
# Update the repo, else clone a new one
	if [ -d tack ]; then
		cd tack
		hg pull -u
		cd $srcdir
	else
		hg clone http://tack.hg.sourceforge.net:8000/hgroot/tack/tack
	fi

  msg "setting up build directories"
  rm -rf $srcdir/build
  cp -ar $srcdir/tack $srcdir/build
  rm -rf $srcdir/tmp
  mkdir $srcdir/tmp
  cd $srcdir/build
  export CC=gcc

  msg "patching configuration file"
  patch -p0 $srcdir/build/config.pm -i $srcdir/configpm.patch
  
  msg "running configuration and building it"
  ./pm configure
  ./pm
}

package() {
  cd $srcdir/build
  msg "packaging The Amsterdam Compiler Kit"
  ./pm install
  rm -rf $srcdir/tmp
}