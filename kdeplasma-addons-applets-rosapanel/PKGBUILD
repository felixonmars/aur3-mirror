#Maintainer: wrajaka
#Contributor: Neo Kolokotronis <tetri4@gmail.com>

pkgname=kdeplasma-addons-applets-rosapanel
_pkgname=rosapanel
pkgver=1.0
_pkgver=1.0-06
pkgrel=3
pkgdesc="ROSA panel include RocketBar, and special build Icon and Trash applets. As seen on Mandriva 2011."
arch=('i686' 'x86_64')
url="http://rosalab.ru/"
license=('LGPL2')
depends=('kdebase-workspace' 'kdeplasma-addons-applets-stackfolder' 'plasma-theme-rosa')
makedepends=('rpmextract' 'cmake' 'automoc4')
conflicts=('kdeplasma-applets-rosapanel')
replaces=('kdeplasma-applets-rosapanel')
source=(ftp://ftp.pbone.net/mirror/carroll.cac.psu.edu/pub/linux/distributions/mandrakelinux/devel\
/cooker/SRPMS/main/release/${_pkgname}-${_pkgver}.src.rpm)
md5sums=('d6e20f807f99bdff54803dee53ec3b7e')
	
build() {
	cd $startdir/src/
        rpmextract.sh ${_pkgname}-${_pkgver}.src.rpm
        tar -xvf ${_pkgname}-${pkgver}.tar.gz
        cd ${_pkgname}-${pkgver}/build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
        make || return 1
}

package() {
       	cd $startdir/src/${_pkgname}-${pkgver}/build
        make DESTDIR=$startdir/pkg install || return 1
}