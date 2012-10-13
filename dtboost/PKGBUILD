# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=dtboost
pkgver=1.6.15
pkgrel=1
pkgdesc="Deamon that in- and decreases priority of processes on the fly (both CPU and disk I/O)"
url="http://code.google.com/p/dtboost/"
license="GPL3"
arch=('any')
depends=(python2)
optdepends=('cpulimit: CPU use limit per process')
install=dtboost.install
backup=('etc/dtboost.conf')
source=(http://dtboost.googlecode.com/files/dtboost-${pkgver}.tgz)

build() {
	cd ${srcdir}/${pkgname}

	rm -rf ${pkgdir}/*

	mkdir -p ${pkgdir}/usr/share/dtboost/
	install -m 744 ${srcdir}/dtboost/dtboost.py ${pkgdir}/usr/share/dtboost/

	mkdir -p ${pkgdir}/etc/rc.d/
	install -m 744 ${srcdir}/dtboost/dtboost.initscript ${pkgdir}/etc/rc.d/dtboost 

	mkdir -p ${pkgdir}/etc/rc.d/
	install -m 644 ${srcdir}/dtboost/dtboost.conf ${pkgdir}/etc/

	mkdir -p ${pkgdir}//usr/lib/systemd/system/
	install -m 644 ${srcdir}/dtboost/dtboost.service ${pkgdir}/usr/lib/systemd/system/
}

sha1sums=('cb8e92515dde26f4cbe84f05ec0c86776dd5b46e') 
