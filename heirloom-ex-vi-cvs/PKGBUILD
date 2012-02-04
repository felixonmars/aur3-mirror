# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributed by: Jens Staal <staal1978@gmail.com>
pkgname=heirloom-ex-vi-cvs
pkgver=2011.06.22
pkgrel=1
pkgdesc="The traditional Vi"
arch=('i686' 'x86_64')
url="http://ex-vi.sourceforge.net/"
license=('Custom:BSD')
provides=('vi')
depends=('heirloom-cvs')
source=('Makefile.patch')
md5sums=('9464be14a42fbf6f9f0a60a8be93db1e')
makedepends=('cvs')


build() {
cd $srcdir
	msg "getting traditional vi sources"
	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/ex-vi login

	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/ex-vi co ex-vi

	msg "getting missing header files from heirloom"

	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom/ login #getting some missing headers

	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom/ co heirloom/libcommon



	msg "setting up build directory"
	rm -rf $srcdir/build
	cp -ar $srcdir/ex-vi $srcdir/build
	cd $srcdir/build
	patch -p0 $srcdir/build/Makefile -i $srcdir/Makefile.patch

	msg "initial make"
	export CC="gcc -I $srcdir/heirloom/libcommon"
        make  || return 1
}

package() {
	cd $srcdir/build
        
	msg "make install"
        make DESTDIR="$pkgdir" install
	mkdir -p $pkgdir/usr/share/licences/ex-vi/ 
        install -m644 $srcdir/ex-vi/LICENSE $pkgdir/usr/share/licences/ex-vi/LICENSE
}