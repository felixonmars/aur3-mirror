#Contributor: Erico Nunes <nunes dot erico at gmail>
#Maintainer: Erico Nunes <nunes dot erico at gmail>

pkgname=fractanoid
pkgver=0.2
pkgrel=3
pkgdesc="Fractal generator using Qt4, multithreading and the Mandelbrot set"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php/Fractanoid?content=56525"
license=(GPL)
depends=(qt4)
source=("http://kde-apps.org/CONTENT/content-files/56525-${pkgname}-${pkgver}.tar.bz2")
md5sums=('0ed6e63152f95b1dbecd6895142d3f1e')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	echo "installfiles.files = $pkgname" >> $pkgname.pro
	echo "installfiles.path = $pkgdir/usr/bin" >> $pkgname.pro
	echo "INSTALLS += installfiles" >> $pkgname.pro

	qmake-qt4
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make install
}

