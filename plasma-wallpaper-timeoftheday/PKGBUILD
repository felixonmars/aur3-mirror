# Contributor: Martin Lee <hellnest.fuah@gmail.com
pkgname=plasma-wallpaper-timeoftheday
pkgver=0.1
pkgrel=7
pkgdesc="Wallpaper time of the day"
arch=('i686' 'x86_64')
url="http://www.mandriva.com"
license="GPL"
makedepends=('cmake' 'automoc4')
source=(http://ftp.free.fr/mirrors/ftp.mandriva.com/MandrivaLinux/devel/2011.0/SRPMS/main/release/$pkgname-$pkgver-$pkgrel.src.rpm)
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

sha256sums=('611ea01aa490357b4aeda63e8a9cb26e944e6c454dcfdad7dcb84698f36b9378')
