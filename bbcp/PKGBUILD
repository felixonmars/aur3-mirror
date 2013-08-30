# Maintainer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=bbcp
pkgver=13.05.03.00.0
pkgrel=1
pkgdesc="bbcp is a point-to-point network file copy application written by Andy Hanushevsky at SLAC as a tool for the BaBar collaboration. It is capable of transferring files at approaching line speeds in the WAN."
arch=('x86_64')
url="http://www.slac.stanford.edu/~abh/bbcp/"
license=('custom')
depends=('perl')
source=(http://www.slac.stanford.edu/~abh/bbcp/bbcp.tgz)
md5sums=(b778671ee85fd2e9efba33ab0b5f90a4)

build() {
		cd $srcdir/$pkgname/src
		perl -i -plane 's/\/lib64\//\/lib\//' Makefile
		perl -i -plane 's/uname -i/uname -m/' Makefile
		make
}

package() {
		cd $srcdir/$pkgname
		osver=`./MakeSname`
		mkdir -p $pkgdir/usr/bin
		install $srcdir/$pkgname/bin/$osver/bbcp $pkgdir/usr/bin
}
