pkgname=ppsei
arch=('i686' 'x86_64')
pkgver=0.3
pkgrel=3
pkgdesc="Extracting image files from Microsoft's Powerpoint (PPS/PPT) files"
url="http://sourceforge.net/projects/ppsei/"
license='GPL'
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.src.tgz")
md5sums=('fac5d96b76ae82aa6060437caf05cd43')
makedepends=sed

build() {
	cd $srcdir/$pkgname
	if test "$CARCH" == x86_64
	then
		sed s/'-march=i686 $(DEFS)'/'$(DEFS)'/ Makefile > Makefile.tmp
		mv -f Makefile Makefile.orig
		mv -f Makefile.tmp Makefile
	fi
	make || return 1
	install -Dps -m755 $pkgname $pkgdir/usr/bin/$pkgname
} 
