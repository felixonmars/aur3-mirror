# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=9vx-hg
pkgver=20110614
pkgrel=2
pkgdesc="An x86 virtual machine for running Plan9"
arch=('i686' 'x86_64')
license=('LGPLv2.1' 'BSD' 'LPL')
url="https://bitbucket.org/rminnich/vx32"
makedepends=('mercurial')
source=('GNUmakefile')
md5sums=('eacbf36d5d14b0760cd88902c1066e90')


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d vx32 ]; then
		cd vx32
		hg pull -u
		cd $srcdir
	else
		hg clone https://bitbucket.org/rminnich/vx32
	fi
  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/vx32 $srcdir/build
  cd $srcdir/build/src
  cp $srcdir/GNUmakefile $srcdir/build/src/
  mkdir -p $pkgdir/opt/vx32/bin
  mkdir -p $pkgdir/opt/vx32/lib
  make
}

package() {
  cd $srcdir/build/src
  make install 
  install -Dm644 $srcdir/vx32/src/libvx32/LICENSE $pkgdir/usr/share/licenses/$pkgname/libvx32.LICENSE
  install -Dm644 $srcdir/vx32/src/vxrun/LICENSE $pkgdir/usr/share/licenses/$pkgname/vxrun.LICENSE
  install -Dm644 $srcdir/vx32/src/9vx/LICENSE $pkgdir/usr/share/licenses/$pkgname/9vx.LICENSE
}