# Maintainer: Pierre Neidhardt <ambrevar at gmail dot com>

_pkgname=libimago2
pkgname=$_pkgname-svn
pkgver=20130110.105
pkgrel=1
pkgdesc="Image file format I/O library"
url="http://gfxtools.sourceforge.net/"
license=('custom')
arch=(i686 x86_64)
provides=('libimago')
conflicts=('libimago')
makedepends=('svn')
source=("svn+http://gfxtools.svn.sourceforge.net/svnroot/gfxtools/libimago2")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	LC_ALL=C svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

build() {
	cd "$srcdir/$_pkgname"
	sed -i 's|PREFIX = /usr/local|PREFIX = /usr|' configure
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="${pkgdir}" install
}
