# Author: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=silentbob
pkgver=2.4.1
pkgrel=1
pkgdesc="A tool to help a programmer/team manager to digest and comprehend either a simple program or a big source code tree based on the source code by presenting the code in a searcheable and tagged way."
arch=('i686' 'x86_64')
license=('GPL')
url="http://silentbob.sourceforge.net"
source=(http://sourceforge.net/projects/silentbob/files/silentbob2/silentbob-2.4/silentbob-2.4.1.tar.gz)

build() {
	rm -rf $srcdir/build
  mkdir -p $srcdir/build
  cd $srcdir/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

md5sums=('6aee369be65160dec9287c414bb2c597')
# vim:set ts=2 sw=2 sts=2 et ft=sh:
