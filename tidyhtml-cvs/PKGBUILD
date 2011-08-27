pkgname=tidyhtml-cvs
pkgver=20080429
pkgrel=1
pkgdesc="A tool to tidy down your HTML code to a clean style"
url="http://tidy.sourceforge.net/"
license=
arch=(i686 x86_64)

depends=()
makedepends=('cvs')
conflicts=('tidyhtml')
provides=('tidyhtml')
replaces=('tidyhtml')
license=('custom')

source=()
md5sums=()

_cvsroot=":pserver:anonymous:@tidy.cvs.sourceforge.net:/cvsroot/tidy"
_cvsmod="tidy"

build() {
	cd $startdir/src
	msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
	if [ -d $_cvsmod/CVS ]; then
		(cd $_cvsmod &&	cvs -z3 update -d)
	else
		cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
	fi

	msg "CVS checkout done or server timeout"
	msg "Starting make..."

	cp -rT $_cvsmod $_cvsmod-build
	cd $_cvsmod-build

	sh build/gnuauto/setup.sh
	./configure --prefix=/usr --enable-access --enable-utf16 --enable-asian
	make
	make DESTDIR=$pkgdir install
	
	install -Dm644 htmldoc/license.html $pkgdir/usr/share/licenses/$pkgname/license.html
	rm $pkgdir/usr/lib/libtidy.la

	rm -rf ../$_cvsmod-build
}
# vim:syntax=sh
