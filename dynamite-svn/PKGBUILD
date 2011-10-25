# Maintainer: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=dynamite-svn
pkgver=4012
pkgrel=1
pkgdesc="Dynamite is a tool and library for decompressing data compressed with PKWARE Data Compression Library. Svn version"
arch=('i686' 'x86_64')
url="http://synce.sourceforge.net/"
license=("GPL")
source=()
md5sums=()
provides=('dynamite')
conflicts=('dynamite')


_svntrunk=https://synce.svn.sourceforge.net/svnroot/synce/trunk/dynamite
_svnmod=dynamite

build() {
	cd $startdir/src
	svn co $_svntrunk -r $pkgver $_svnmod
	cd dynamite
	./bootstrap
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}
