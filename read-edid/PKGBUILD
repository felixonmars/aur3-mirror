# Maintainer: LaraCraft304 <lara@craft.net.br>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=read-edid
pkgver=3.0.0
pkgrel=1
pkgdesc="Program that can get information from a PNP monitor"
arch=('i686' 'x86_64')
url="http://www.polypux.org/projects/read-edid/"
license=('GPL')
depends=('libx86>=0.99')
source=("http://www.polypux.org/projects/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2ac6821cb3ef2eb7f62583f49f0867e0')

prepare() {
	if [ -d "$pkgname-build" ]; then
		rm -rf ${pkgname}-build/*
	else
		mkdir ${pkgname}-build
	fi
	
	sed 's|DESTINATION man|DESTINATION share/man|g' -i $pkgname-$pkgver/CMakeLists.txt
	sed 's|DESTINATION doc|DESTINATION share/doc|g' -i $pkgname-$pkgver/CMakeLists.txt
}

build() {
	cd $pkgname-build/
	
	cmake "$srcdir"/$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX="/usr"
	
	make
}

package() {
	cd $pkgname-build/
	
	make DESTDIR="$pkgdir/" install
}
