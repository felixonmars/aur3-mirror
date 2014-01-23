pkgname=zfone
pkgver=0.92.246
pkgrel=4
pkgdesc="Zfone is software for secure voice communication over the Internet (VoIP), using the ZRTP protocol"
url="http://zfoneproject.com"
arch=('i686' 'x86_64')
license=("custom:Copyright Philip Zimmermann")
makedepends=('automake' 'autoconf' 'libzrtp')
source=('http://wakusi.de/download/zfone-linux.tar')
sha512sums=('1feda208fea9d7050f15822a0f8aba9cd1d521a5e41c0ec62e48b733be83d38ce8a7419a2556dd5b7c564142a6fe9b1d42a465a98f01c0e449bde2de76dd3eca')

prepare() {
	cd "${srcdir}/zfone-linux"
	tar --strip-components=1 -zxvf ./zfone-$pkgver.tar.gz
	sed -i '11s/\/giochannel//' include/zfoneg_ctrl.h
}

build () {
	cd "${srcdir}/zfone-linux"
	./cfg
	make
}
package() {
	cd "${srcdir}/zfone-linux"
	sed -i 's/prefix = \/usr\/local/prefix = ${DESTDIR}\/usr\/local/' resources/Makefile
	sed -i 's/\/usr\/share\//${DESTDIR}\/usr\/share\//' Makefile
	sed -i '936i\\tmkdir -p ${DESTDIR}\/usr\/share\/icons\/hicolor\/48x48\/apps' Makefile
	sed -i '936i\\tmkdir -p ${DESTDIR}\/usr\/share\/applications' Makefile
	make DESTDIR="$pkgdir" install
}
