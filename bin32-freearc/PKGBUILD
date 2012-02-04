# Contributor: Artiom MOLCHANOV <ar.molchanov@gmail.com>

pkgname=bin32-freearc
pkgver=0.666
namefile=FreeArc-${pkgver}-linux-i386
pkgrel=1
pkgdesc="FreeArc archiver combines unexampled speed/compression ratio and multitude of features"
license=('GPL')
arch=('x86_64')
depends=('lib32-curl' 'lib32-gtk2' 'lib32-gmp4')
url="http://freearc.sourceforge.net/"
source=(http://freearc.org/download/${pkgver}/${namefile}.tar.bz2
Makefile.patch 
freearc.desktop)
options=(!emptydirs)
#install=${pkgname/bin32-/}.install
md5sums=('d522c029c733b0b7d394b489e187a687'
         '3cb2c6a20422f4a5e391dd8302b3221a'
         'c21aadf1ba45785140b1e84b4fe41d5d')


build() {   
	cd "$srcdir/FreeArc-${pkgver}-linux-i386"

	patch -p0 < "$startdir/Makefile.patch"
	make DESTDIR="$startdir/pkg" install || return 1 

        mkdir -p ${startdir}/pkg/usr/share/applications
	install -D -m 644 ${startdir}/freearc.desktop ${startdir}/pkg/usr/share/applications/
}  
