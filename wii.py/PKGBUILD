pkgname=wii.py
pkgver=0.8.6
pkgrel=1
pkgdesc="Wii.py provides editors and classes for many file types and files present on the Wii, especially files in banners. Can edit U8 archives, convert images to/from png and tpl, add imet and imd5 headers, load and extract wii optical discs."
url="http://wiibrew.org/wiki/Wii.py"
license=('GPL')
arch=('any')
depends=('python')
source=("http://jafile.com/uploads/icefire/$pkgname-$pkgver.zip")
md5sums=('e551479f42ad20ed64221d5a2010229b')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/$pkgname
	cp -r *.py experimental pywii $pkgdir/usr/share/$pkgname
}
