# Contributor: Patrick Schwalm <patrick.schwalm@gmx.de>

pkgname=rtm-google-plasmoid
pkgver=1.0
pkgrel=1
pkgdesc="This plasmoid integrates the google todo list in your plasma desktop"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Remember+The+Milk+Google+Gadget+Plasmoid?content=101426&PHPSESSID=4d49a80271871f1c4dede72ca6c36dac"
license=('GPL')
groups=()
depends=('kdebase-workspace>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://kde-look.org/CONTENT/content-files/101426-plasma-widget-remeberthemilk.tar.gz")
noextract=()
md5sums=('22af9ccd14b8578addbf227b98ca5138')
         
build() 
{
	cd $startdir/src/plasma-widget-remeberthemilk-${pkgver}.0/
        mkdir build
        cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make || return 1
        make DESTDIR=$startdir/pkg install || return 1
        kbuildsycoca4
}
