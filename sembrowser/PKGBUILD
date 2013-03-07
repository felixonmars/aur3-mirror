#Contributor: Flamelab <panosfilip@gmail.com>

pkgname=sembrowser
pkgver=0.3
pkgrel=2
pkgdesc="A prototype of a semantic faceted file manager for KDE 4"
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/Sembrowser?content=117692&PHPSESSID=926bb074f744440ea6e3c28bdf219063'
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
install='sembrowser.install'
source=("http://kde-apps.org/CONTENT/content-files/117692-${pkgname}-${pkgver}.tar.gz")

build() {
	cd $srcdir/${pkgname}

	if [ -d build ];then 
            rm -r build;
        fi
        mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
	make
}

package() {
	cd $srcdir/${pkgname}/build
	make DESTDIR=$pkgdir install || return 1
}

md5sums=('cd0c67cec2c9b31810e58b336a54419b')
