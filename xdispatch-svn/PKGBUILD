# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=xdispatch-svn
pkgver=20110530
pkgrel=1
pkgdesc="A cross-platform implementation of Grand Central Dispatch"
arch=('i686' 'x86_64')
license=('Apache')
url="http://opensource.mlba-team.de/xdispatch/"
depends=('clang' 'libkqueue')
makedepends=('subversion' 'cmake')


build() {
  cd $srcdir
# Update the repo, else clone a new one
	if [ -d libxdispatch ]; then
		cd libxdispatch
		svn up
		cd $srcdir
	else
		svn co http://opensource.mlba-team.de/svn/xdispatch/trunk libxdispatch
	fi

  export CC=clang
  export CXX=clang++

  rm -rf $srcdir/build
  cp -ar $srcdir/libxdispatch $srcdir/build
  cd $srcdir/build
  cmake -G "Unix Makefiles"
  make all
}

package() {
  cd $srcdir/build

  mkdir -p $pkgdir/usr/share/licenses/xdispatch
  install -m644 $srcdir/libxdispatch/LICENSE $pkgdir/usr/share/licenses/xdispatch/LICENSE
}
