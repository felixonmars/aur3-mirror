# Contributor: marcotangaro <marco_tangaro@hotmail.com>
pkgname=device-manager-plasmoid
pkgver=1.1.1
pkgrel=1
pkgdesc="Plasmoid Binary"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Device+Manager?content=106051"
license=('GPL')
source=(http://www.kde-look.org/CONTENT/content-files/106051-devicemanager-${pkgver}.tar.bz2)
md5sums=('db5a40a2eff590c92ab6bde10c52115a')

build() {
	cd $startdir/src/devicemanager
        rm -r build     
        mkdir build
        cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make || return 1
        make DESTDIR=$startdir/pkg install || return 1
        rm -r $startdir/src/devicemanager/build
        #rm $startdir/pkg/usr/share/apps/solid/actions/test-predicate-openinwindow.desktop
}
