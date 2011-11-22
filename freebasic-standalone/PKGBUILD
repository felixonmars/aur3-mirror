# Contributor: mail@tux.nsk.ru

pkgname=freebasic-standalone
pkgver=0.23.0
pkgrel=1
pkgdesc="A standalone free BASIC compiler"
arch=('i686' 'x86_64')
url="http://www.freebasic.net/"
license=('GPL2' 'LGPL')
provides=('fbc')
source=(http://space.dl.sourceforge.net/project/fbc/Binaries%20-%20Linux/FreeBASIC-$pkgver-linux-standalone.tar.gz)
md5sums=('0789747273bad417e11180505bddafb5')

build() {
	cd ${srcdir}
	tar -xf ../FreeBASIC-${pkgver}-linux-standalone.tar.gz
}

package() {
	cd ${srcdir}/FreeBASIC-${pkgver}-linux-standalone
	mkdir ${pkgdir}/opt/
	sed -i 's/gzip -c docs\/fbc.1/#gzip -c docs\/fbc.1/g' ./install-standalone.sh
	./install-standalone.sh -i ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin/
	ln -s /opt/freebasic/fbc ${pkgdir}/usr/bin/fbc-standalone
}

