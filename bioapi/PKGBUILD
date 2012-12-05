# Contributor: So1aris <homer.j.simson.bis@gmail.com>

pkgname=bioapi
pkgver=1.2.4
pkgrel=1
pkgdesc="The BioAPI Specification is intended to provide a high-level generic biometric authentication model."
arch=('i686')
url="http://code.google.com/p/bioapi-linux/"
license=('New BSD')
makedepends=()
depends=('qt')
source="http://bioapi-linux.googlecode.com/files/${pkgname}_${pkgver}.tar.gz"
md5sums=('98c20bd7bb2d87f24980c87b6e1c3fb6')

build(){
	cd $srcdir/${pkgname}-linux
	sed 's/bnv_qt_LIBS="-l$bnv_qt_lib_dir $LIBS"/bnv_qt_LIBS="-L$bnv_qt_lib_dir $LIBS"/' configure > configure_B
	mv configure_B configure
	chmod +x configure
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/${pkgname}-linux
	
	make DESTDIR=$pkgdir install
	#make clean
}
