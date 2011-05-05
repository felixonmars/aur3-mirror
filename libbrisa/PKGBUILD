# Contributor: Tim Besard <tim.besard@gmail.com>
pkgname=libbrisa
pkgver=0.1.1
pkgrel=1
pkgdesc="BRisa is a project focused on the development of UPnP technologies. It provides an API to building UPnP devices, services and control points."
arch=('i686' , 'x86_64')
url="http://brisa.garage.maemo.org/"
license=('LGPL')
depends=('qt' 'libqxt')
source=(https://garage.maemo.org/frs/download.php/8365/$pkgname_$pkgver.tar.gz)

noextract=()
build() {
	cd $startdir/src/qt-brisa
	./configure -prefix /usr
	make || return 1
	make INSTALL_ROOT=$startdir/pkg install || return 1
}
md5sums=('b788ac2c519061567f42432f1e6b7c8d')

