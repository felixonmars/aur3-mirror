#Maintainer: zilti
#Contributor: Neo Kolokotronis <tetri4@gmail.com>

pkgname=kdeplasma-applets-rosapanel
_pkgname=rosapanel
pkgver=1.0
_pkgver=1.0-30
pkgrel=3
pkgdesc="ROSA panel include RocketBar, and special build Icon and Trash applets. As seen on Mandriva 2011."
arch=('i686' 'x86_64')
url="http://rosalab.ru/"
license=('LGPL2')
depends=('kdebase-workspace' 'kdeplasma-applets-stackfolder' 'plasma-theme-rosa')
makedepends=('rpmextract' 'cmake' 'automoc4')
source=(http://mirror.yandex.ru/rosa/rosa2012lts/repository/SRPMS/main/release/${_pkgname}-${_pkgver}.src.rpm)
md5sums=('cb8b29fa3776eccc7f6ee45efae4cee4')
	
build() {
	cd $startdir/src/
        rpmextract.sh ${_pkgname}-${_pkgver}.src.rpm
        tar -xvf ${_pkgname}-${pkgver}.tar.gz
        mkdir ${_pkgname}-${pkgver}/build
        cd ${_pkgname}-${pkgver}/build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
        make || return 1
}

package() {
       	cd $startdir/src/${_pkgname}-${pkgver}/build
        make DESTDIR=$startdir/pkg install || return 1
}