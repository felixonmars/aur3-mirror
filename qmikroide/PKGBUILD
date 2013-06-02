# Maintainer: Bartosz Chmura <chmurli at gmail dot com>

pkgname=qmikroide
pkgver=1.2
pkgrel=3
pkgdesc="Fast, useful & tiny AVR's assembler IDE."
arch=('any')
url="http://damiankmiecik.tk/qmikroide/"
license=('BSD')
depends=()
source=(http://damiankmiecik.tk/downloads/qMikroIDE_v1_2_linux
  qmikroide.desktop)
options=(!strip)
md5sums=('9aca4aa9353c233b95540b6ac3536576'
  'fae1abdc042c9167d1039c8070bff7b1')


package () {
	
	mkdir -p ${pkgdir}/usr/bin/${pkgname}

	cd $pkgdir
	cp -r ${srcdir}/qMikroIDE_v1.2_linux/* usr/bin/${pkgname}
	chmod -R 755 usr/bin/${pkgname}


	install -d -m 755 usr/share/applications || return 1
	install -m 644 ${srcdir}/qmikroide.desktop usr/share/applications || return 1
}
