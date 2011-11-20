# Maintainer: Kevin Vesga <31337h4ck3r@gmail.com>

pkgname=scope
pkgver=0.4a
pkgrel=1
pkgdesc="Pure Qt filemanager focused on usability"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/scOpe?content=140330"
license=('GPL')
depends=('qt')
source=(http://qt-apps.org/CONTENT/content-files/140330-$pkgname-$pkgver.tar.gz 
		scope.desktop)
md5sums=('aa49637f1aeab4621196df9bdb022459' 
		 '830f9cbf580785ae0a7fd1404cdd4900')

build() {
	cd "$srcdir/$pkgname-$pkgver"
   	qmake
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 $srcdir/$pkgname-$pkgver/scope $startdir/pkg/usr/bin/scope
	install -Dm 644 $srcdir/scope.desktop $pkgdir/usr/share/applications/scope.desktop
}

