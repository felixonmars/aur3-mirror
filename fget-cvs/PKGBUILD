# Maintainer: Tino Reichardt <milky-archlinux@mcmilk.de>
pkgname=fget-cvs
pkgver=0.5
pkgrel=20060718
pkgdesc="a minimal http/ftp download tool"
url="http://www.fefe.de/fget/"
license="GPL"
depends=()
provides=('fget')
replaces=()
conflicts=()
makedepends=('cvs' 'dietlibc')
install=()
backup=()
source=()
md5sums=()

_cvsroot=":pserver:cvs@cvs.fefe.de:/cvs"
_cvsmod="fget"

build() {
	msg "getting $_cvsmod from $_cvsroot ..."
	cvs -z9 -d $_cvsroot co -D $pkgrel -f $_cvsmod
	cd $_cvsmod

	cd $startdir/src/fget
	echo 'diet gcc -Os' > conf-cc
	echo 'diet gcc -s'  > conf-ld
	make fget
	mkdir -p $startdir/pkg/man/man1 $startdir/pkg/usr/bin
	cp -f fget1 $startdir/pkg/man/man1
	cp -f fget $startdir/pkg/usr/bin
}
