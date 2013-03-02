# Maintainer: Army <contact me on the forums if you have questions>
# Contributor: cga <cga@cga.cx> 

pkgname=simplesysexxer
_pkgname=SimpleSysexxer
pkgver=0.3
pkgrel=4
pkgdesc="GUI tool to create backups of the memory contents of MIDI devices"
arch=('i686' 'x86_64')
url="http://www.christeck.de/wp/products/simple-sysexxer/"
license=('GPL')
depends=('qt4')
source=("http://sourceforge.net/projects/sysexxer/files/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('59c1b91089bb15050e3a58aa602332db')
install=$pkgname.install

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	sed -i 's/\/usr\/local\/bin/\/usr\/bin/g' SimpleSysexxer.pro
	qmake-qt4 SimpleSysexxer.pro
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	sed -i '/Categories/c Categories=Audio;AudioVideo;Midi' bin/simplesysexxer.desktop
	make INSTALL_ROOT=${pkgdir} install
}
