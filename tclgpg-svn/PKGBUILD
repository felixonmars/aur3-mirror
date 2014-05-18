# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

pkgname=tclgpg-svn
pkgver=76
pkgrel=1
pkgdesc="Tcl interface to GNU Privacy Guard with interface similar to TclGPGME."
arch=('i686' 'x86_64')
url="http://code.google.com/p/tclgpg/"
license=('BSD')
depends=('tcl' 'tcllib' 'gnupg2')
_svnmod=tclgpg-svn
source=("$_svnmod::svn+http://tclgpg.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$_svnmod
	svnversion | tr -d [A-z]
}

build() {
	cd "$srcdir/$_svnmod"
	autoconf
	./configure
	make
}

package() {
	cd "$srcdir/$_svnmod"
	make DESTDIR=$pkgdir install
	install -D -m644 license.terms $pkgdir/usr/share/licenses/tclgpg/LICENSE
}
