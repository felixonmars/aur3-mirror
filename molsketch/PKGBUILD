# Contributor : Dan Vratil <progdan@progdansoft.com>

pkgname=molsketch
pkgver=0.2.0
pkgrel=1
pkgdesc="A molecular drawing tool for 2D molecular structures" 
arch=('i686' 'x86_64')
url="http://molsketch.sf.net" 
license=('GPLv2') 
depends=('openbabel' 'qt4' 'qt-assistant-compat') 
source=(http://downloads.sourceforge.net/molsketch/Molsketch-${pkgver}-Source.tar.gz) 
md5sums=('a12d5424adf80aa6c2ee41f8231ca016')

build() {
	if [ ! -d ${srcdir}/build ]; then
		mkdir -p ${srcdir}/build
	fi
	cd ${srcdir}/build
  
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		../Molsketch-${pkgver}-Source
	make
}

package() {
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}
