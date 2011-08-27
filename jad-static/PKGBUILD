# Contributor: maggiolo00 <maggiolo00@gmail.com>
pkgname=jad-static
pkgver=158
pkgrel=e
pkgtype=linux.static
pkgdesc="A java decompiler"
license="unknown"
arch=('i686' 'x86_64')
url="http://www.varaneckas.com/jad"
source=("http://www.varaneckas.com/sites/default/files/jad/jad158e.linux.static.zip")
md5sums=('b596c7865fe7e61ee5d729424a747646')
build() {
	mkdir -p $startdir/pkg/usr/bin
	install -m755 $startdir/src/jad $startdir/pkg/usr/bin/
}


