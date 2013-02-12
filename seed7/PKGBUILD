pkgname=seed7
pkgver="05_20130203"
pkgrel=3
pkgdesc="An extensible, general purpose programming language."
arch=('i686' 'x86_64')
url="http://seed7.sourceforge.net"
license=('GPL2' 'LGPL')
install=
depends=('ncurses' 'libx11')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}_${pkgver}/${pkgname}_${pkgver}.tgz")
md5sums=('6cdb7bdae1e049e2de73d02b7302314e')

build() {
  cd ${srcdir}/${pkgname}/src
	export S7_LIB_DIR=/usr/lib/${pkgname} SEED7_LIBRARY=/usr/share/${pkgname}/lib
	make depend
	make -j4
	make s7c
}

package() {
	mkdir -p ${pkgdir}/usr/{lib,share}/${pkgname}
	mkdir -p ${pkgdir}/usr/bin
  cd ${srcdir}/${pkgname}/
	cp -a doc prg lib ${pkgdir}/usr/share/${pkgname}
	cp bin/*.a ${pkgdir}/usr/lib/${pkgname}
	rm ${pkgdir}/usr/share/${pkgname}/prg/{s7,s7c}
	install -m755 bin/{s7,s7c} ${pkgdir}/usr/bin
}
