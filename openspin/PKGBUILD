# Maintainer: Matthias Riegler <riegler.matthias2@gmail.com>

pkgname=openspin
pkgdesc="Open Source SPIN interpreter for the Parallax(R) Propeller. Git Version"
pkgver=git
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/reltham/OpenSpin"
license=('MIT')
depends=('git')

prepare() {
	cd ${srcdir}
	git clone https://github.com/reltham/OpenSpin.git
}


build() {
	cd "${srcdir}/OpenSpin/"
	make ${MAKEFLAGS} 
}

package() {
	cd "${srcdir}/OpenSpin/"
	mkdir -p ${pkgdir}/usr/bin
	cp openspin ${pkgdir}/usr/bin/
	chmod 777  ${pkgdir}/usr/bin/openspin
}
