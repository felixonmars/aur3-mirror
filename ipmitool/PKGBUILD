# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: gori

pkgname=ipmitool
pkgver=1.8.13
pkgrel=1
pkgdesc="Command-line interface to IPMI-enabled devices"
arch=('i686' 'x86_64')
url="http://ipmitool.sourceforge.net"
depends=('openssl')
license=('BSD')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('64f36baea740f701c5f287805da968a2')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --with-kerneldir
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i '
		s/bin_PROGRAMS = ipmitool$(EXEEXT)/bin_PROGRAMS = ipmitool$(EXEEXT) ipmievd$(EXEEXT)/
		/sbin_PROGRAMS = ipmievd$(EXEEXT)/d
	' src/Makefile
	make DESTDIR="${pkgdir}" install
	rmdir "${pkgdir}/usr/sbin"

	# Install license
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
