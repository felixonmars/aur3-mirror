# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=kdeplasma-addons-applets-rosalauncher
_pkgname=rosa-launcher
pkgver=0.34.12
_pkgver=0.34.12-1
pkgrel=1
pkgdesc="ROSA launcher menu, this is kde4 menu with simpleWelcome and nepomuk-timeline. Developed by Mandriva."
arch=('i686' 'x86_64')
url="http://rosalab.ru/"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('rpmextract' 'cmake' 'automoc4')
source=(http://mirror.yandex.ru/rosa/rosa2012lts/repository/srpms/main/release/rosa-launcher-${_pkgver}.src.rpm)
md5sums=('aec86b31bb38c1d8223cd453c24995e1')
	
build() {
	cd $startdir/src/
        rpmextract.sh ${_pkgname}-${_pkgver}.src.rpm
        tar -xvf ${_pkgname}-${pkgver}.tar.gz
        cd ${_pkgname}-${pkgver}
		make build
}

package() {
       	cd $startdir/src/${_pkgname}-${pkgver}
        make DESTDIR=$startdir/pkg install || return 1
}