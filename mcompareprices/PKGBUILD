# Maintainer: Marat "Morion" Talipov <morion.self@gmail.com>

pkgname=mcompareprices
pkgver=0.1.3
pkgrel=1
pkgdesc="Compare prices for your shopping"
arch=('i686' 'x86_64')
url="https://www.mComparePrices.org"
license=('GPLv2')
depends=('qt5-base')
makedepends=('qt5-base' 'qt5-tools')
source=("https://github.com/Morion-Self/mComparePrices/archive/$pkgver.tar.gz") 
md5sums=('8bd2826c2370d336835d65e50266103f')

build() {

	cd "$srcdir/mComparePrices-$pkgver/share/mcompareprices/lang"
	lrelease ru.ts 

	cd "$srcdir/mComparePrices-$pkgver"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build
	msg "Building ..." 
	qmake -r -spec linux-g++ PREFIX=/usr ..
	make clean
	make 
}

package() {

	cd "$srcdir/mComparePrices-$pkgver/build"

  	make INSTALL_ROOT="$pkgdir" install	

	msg "Done"
	
}
