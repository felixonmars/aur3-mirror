# PKGBUILD derived from texmaker-oxygen-icons by damian01w
pkgname=texmaker-nowebkit
_pkgname=texmaker
pkgver=3.3.3
pkgrel=1
pkgdesc="Free cross-platform latex editor, stripped of browser/QtWebKit module."
arch=('i686' 'x86_64')
url="http://www.xm1math.net/texmaker/index.html"
license=('GPL')
depends=('qt>=4.7' 'poppler-qt' 'ghostscript')
conflicts=('texmaker')
#optdepends=('ibus-qt: to avoid some trouble with accented characters')
source=(http://www.xm1math.net/texmaker/$_pkgname-$pkgver.tar.bz2 \
	texmaker.desktop \
	browser.cpp \
	browser.h \
)
md5sums=('4e2cf83ecddab605f2e01e768611aa22'
         '48ca54ffd5eb98a83cbf3626205b8639'
         '989b4dc4e1ac4ace3d0804d15c635012'
         'e70a0efea790555e31716115133249e7'
)

build() {
	cd $srcdir/$_pkgname-$pkgver

	# remove reference for WebKit from texmaker.pro
	sed 's/webkit//' <texmaker.pro >texmaker.pro.new
	mv -f texmaker.pro.new texmaker.pro
	
	# purge browser.h/.cpp
	cp -f $startdir/browser.* .
	
	# run qmake; generate Makefile
	qmake PREFIX=//usr texmaker.pro
	
	make || return 1
}
package() {
	cd $srcdir/$_pkgname-$pkgver
	
	export INSTALL_ROOT=$pkgdir
	make install
	
	rm -f $pkgdir/usr/share/texmaker/{*.desktop,COPYING}
	
	install -D -m644 images/appicon.png \
		$pkgdir/usr/share/pixmaps/texmaker.png
		
	install -D -m644 $srcdir/$_pkgname.desktop \
		$pkgdir/usr/share/applications/$_pkgname.desktop
}

