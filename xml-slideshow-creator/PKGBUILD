pkgname=xml-slideshow-creator
pkgver=0.7
pkgrel=1
pkgdesc="Create custom animated .xml backgrounds."
arch=('i686')
url="http://gtk-apps.org/content/show.php/XML+slideshow+creator?content=119728"
license=GPL
makedepends=('gambas2-runtime' 'gambas2-gb-gtk' 'gambas2-gb-form' 'gambas2-gb-gtk-ext')
source=('http://dl.dropbox.com/u/11893371/AUR/xml-slideshow-creator/xml-slideshow-creator-0.7.tar.gz')
md5sums=('8c6f83646cc8b16d2a0c3557c6c6a9bf')


package() {
	cd $srcdir
	tar xvf $pkgname-$pkgver.tar.gz
	cd xml-slideshow-creator
	mkdir -p $pkgdir/usr/share/xml-slideshow-creator
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	cp $srcdir/xml-slideshow-creator/gen.sh $pkgdir/usr/share/xml-slideshow-creator
	cp $srcdir/xml-slideshow-creator/xmlslide.png $pkgdir/usr/share/xml-slideshow-creator
	cp $srcdir/xml-slideshow-creator/xml-slideshow-creator $pkgdir/usr/bin 
	cp $srcdir/xml-slideshow-creator/XML-background-creator.desktop $pkgdir/usr/share/applications
}

