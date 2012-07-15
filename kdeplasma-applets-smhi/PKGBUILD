# Contributor: Aurel Canciu <aurelcanciu@gmail.com>
pkgname=kdeplasma-applets-smhi
pkgver=0.2.2
pkgrel=2
pkgdesc="Plasmoid which shows 5-days weather forecast with data from SMHI"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/SMHI+weather+plasmoid?content=93235"
license="GPL"
depends=('kdebase-plasma')
makedepends=('cmake' 'automoc4')
source=(http://www.svenstorp.com/plasma/applets/smhi/$pkgver/plasma-applet-smhi-$pkgver.tar.gz)
md5sums=('2b80d530bb9e965531e0dd28c867cb91')
build() {
	cd $srcdir/plasma-applet-smhi-$pkgver
	rm -rf build
	mkdir build
	cd build
	cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
	make clean
	make VERBOSE=1 || return 1
	make DESTDIR=$pkgdir install || return 1
}
