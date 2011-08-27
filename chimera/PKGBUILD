# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=chimera
pkgver=1.20
pkgrel=2
pkgdesc="C library implementing a structured, peer-to-peer system."
url="http://current.cs.ucsb.edu/projects/chimera/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
source=("http://www.cs.ucsb.edu/%7Eravenben/${pkgname}/download/${pkgname}-${pkgver}.tar.gz" "chimera-64bit.patch")
md5sums=('30951c28fa0169a95ca4818c8483723b' 'c6fa584eab76bc514eaf1aa33fd88e88')

build() {
	cd ${srcdir}/chimera
	
	msg "Patching Key struct for 64bit architecture..."
	patch -p1 <${srcdir}/chimera-64bit.patch || return 1
	
	./configure \
		--prefix=/usr \
		--program-prefix=chimera- \
		|| return 1
	make || return 1
	make install DESTDIR=${pkgdir} || return 1

	# manually install the include files
	msg "Installing headers...";
	install -m 0755 -d ${pkgdir}/usr/include/chimera || return 1
	for i in include/*.h; do
		install -m 0644 "$i" ${pkgdir}/usr/include/chimera || return 1
	done
	cat <<-CHIMERA_H_WRAPPER \
		| install -m 0644 /dev/stdin ${pkgdir}/usr/include/chimera.h
	/** Include the chimera header only */
	#include "chimera/chimera.h"
	CHIMERA_H_WRAPPER
	
	
	# copy the documentation
	msg "Installing documentation...";
	install -m 0755 -d ${pkgdir}/usr/share/doc/chimera || return 1
	install -m 0644 `find docs/ -maxdepth 1 -type f` ${pkgdir}/usr/share/doc/chimera || return 1
	install -m 0755 -d ${pkgdir}/usr/share/doc/chimera/api || return 1
	install -m 0644 `find docs/html -type f` ${pkgdir}/usr/share/doc/chimera/api || return 1
}

