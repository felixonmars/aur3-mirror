# Contributor: Frank Scheffold <fscheffold@googlemail.com>
pkgname=kwinbuttonapplet
pkgver=0.1
pkgrel=1
pkgdesc="Plasmoid Binary"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/KWin+Button+Applet?content=122092"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'kdebase-lib')
source=(http://kde-look.org/CONTENT/content-files/122092-kwinbuttonapplet-0.1.tar.gz)

build() {
	cd $startdir/src/kwinbuttonapplet-${pkgver}
        mkdir build
        cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make || return 1
        make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('343ee842ab209cc8cc2661a0f41f2adc')
