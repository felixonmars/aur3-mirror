# contributor Meow < meow@linux.cn >

pkgname=pdfnup-gui
pkgver=1.0.2
_numb=134874
pkgrel=2
pkgdesc='A Qt frontend GUI for the pdfnup (http://www.warwick.ac.uk/go/pdfjam) and a little bit more.'
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/pdfnup-gui?content=134874."
license=('GPL')
depends=('qt' 'texlive-core' 'imagemagick')
makedepends=('gcc' 'make')
source=("http://qt-apps.org/CONTENT/content-files/${_numb}-${pkgname}.tar.gz"
		"pdfnup-gui.desktop")
md5sums=('df89f808fec62f6b06a0633f4497735a'
		 'bb9f7284f0e8a268d22d2dd59e918435')
build() {
	cd $srcdir/$pkgname
	./configure
	make
}

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps/
	cp -f pdfnup.png $pkgdir/usr/share/icons/hicolor/128x128/apps/
	cp -f pdfnup-gui $pkgdir/usr/bin
	cp -f $srcdir/pdfnup-gui.desktop $pkgdir/usr/share/applications
}