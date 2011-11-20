# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=toybox-hg
pkgver=20111120
pkgrel=1
pkgdesc="A BSD-licensed alternative to busybox"
arch=('i686' 'x86_64')
license=('BSD')
url="http://landley.net/toybox/"
makedepends=('mercurial')

build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d toybox ]; then
		cd toybox
		hg pull -u
		cd $srcdir
	else
		hg clone http://landley.net/hg/toybox
	fi

  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/toybox $srcdir/build
  cd $srcdir/build
  make menuconfig
  sh scripts/make.sh
}

package() {
  mkdir -p $pkgdir/usr/share/licenses/toybox
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/build
  make install
  msg "installing license"
  install -m755 $srcdir/build/toybox $pkgdir/usr/bin/
  cp $srcdir/toybox/LICENSE $pkgdir/usr/share/licenses/toybox/
}