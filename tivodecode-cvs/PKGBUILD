# Maintainer Matthew Bauer <mjbauer95@gmail.com>

pkgname=tivodecode-cvs
pkgver=20090927
pkgrel=1
pkgdesc="Tivo file decoder"
url="http://tivodecode.sf.net/"
arch=(i686 x86_64)
license=('custom')
depends=()
provides=('tivodecode')
conflicts=('tivodecode')
makedepends=('cvs')

_cvsroot=":pserver:anonymous:@tivodecode.cvs.sourceforge.net:/cvsroot/tivodecode"
_cvsmod="tivodecode"

build() {
	cd ${srcdir}

	msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
	if [ -d $_cvsmod/CVS ]; then
		cd $_cvsmod
		cvs -z3 update -d
	else
		cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
		cd $_cvsmod
	fi

	msg "CVS checkout done or server timeout"
	msg "Starting make..."

	cp -r ../$_cvsmod ../$_cvsmod-build
	cd ../$_cvsmod-build

	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
