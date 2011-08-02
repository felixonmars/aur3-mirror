# Contributor: imrahil (Hugo Lobo) <hugo_alobo@hotmail.com>
pkgname=plasma-applet-stackfolder
pkgver=0.1.9
pkgrel=4
pkgdesc="Browse the stack of folders"
arch=('i686' 'x86_64')
url="http://www.mandriva.com"
license="GPL"
makedepends=('cmake' 'automoc4')
source=(http://ftp.free.fr/mirrors/ftp.mandriva.com/MandrivaLinux/devel/2011.0/SRPMS/main/release/$pkgname-$pkgver-12.src.rpm)
md5sums=('011de531e7b17abc4cb7a3c692a3ab17')
build() {
	cd $srcdir
        tar -jxvf $pkgname-$pkgver.tar.bz2
	cd  $pkgname-$pkgver
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
	make clean
	make VERBOSE=1 || return 1
	make DESTDIR=$pkgdir install || return 1
}
