# Contributor: dorin (Dorin Sirbu) <sarbudorin+archlinux@gmail.com>
pkgname=plasma-addons-applets-stackfolder
pkgver=0.1.9
pkgrel=6

original_pkgname=plasma-applet-stackfolder
original_pkgrel=13

pkgdesc="Browse the stack of folders"
arch=('i686' 'x86_64')
url="http://www.mandriva.com"
license="GPL"
makedepends=('cmake' 'automoc4')
source=(http://ftp.free.fr/mirrors/ftp.mandriva.com/MandrivaLinux/devel/2012/SRPMS/main/release/$original_pkgname-$pkgver-$original_pkgrel.src.rpm)
md5sums=('3c264c6cd786ec125a9c21e06ebdc909')
build() {
	cd $srcdir
        tar -jxvf $original_pkgname-$pkgver.tar.bz2
	cd  $original_pkgname-$pkgver
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
	make clean
	make VERBOSE=1 || return 1
	make DESTDIR=$pkgdir install || return 1
}
