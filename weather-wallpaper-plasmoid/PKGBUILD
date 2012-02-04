# Contributor: Ronuk Raval <ronuk.raval-at-gmail.com>

pkgname=weather-wallpaper-plasmoid
pkgver=0.2.1
pkgrel=2
pkgdesc='Changes desktop wallpaper to suit the local weather'
arch=('i686' 'x86_64')
url='http://kde-look.org/content/show.php?content=102185'
license=('GPL')
depends=('kdelibs>=4.2.0' 'kdebase-workspace>=4.2.0' 'kdeartwork>=4.2.0')
makedepends=('cmake' 'make' 'automoc4')
# this plasmoid will be included by default in KDE 4.3
conflicts=('kdeartwork>=4.3.0')
install=$pkgname.install
source=('https://edge.launchpad.net/~echidnaman/+archive/ppa/+files/plasma-wallpaper-weather_0.2.1.orig.tar.gz')
md5sums=('94177bfca63db13bbbb0d837bd36a606')

build() {
	cd ${srcdir}/plasma-wallpaper-weather-$pkgver
	
	mkdir build
	cd build

	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
