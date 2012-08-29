# Manteiner: Elia Notarangelo < elia dot notarangelo at gmail dot com>
# Contributor: Paolo6540 < paolo6540 at xfce-italia dot it >

pkgname=formatx
pkgver=0.2
pkgrel=1
pkgdesc="a simply tool that formats usb device"
arch=('any')
url="http://www.xfce-italia.it/index.php?topic=918.0"
license=('GPL')
depends=('gtkdialog' 'zenity' 'xterm' 'sudo' 'dosfstools')
source=("http://master.dl.sourceforge.net/project/archmind/formatx/$pkgname-$pkgver.tar.gz")


build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	BIN_DIR=${pkgdir}/usr/bin
	CONFIG_DIR=${pkgdir}/usr/share/doc/${pkgname}
	ICON_DIR=${pkgdir}/usr/share/icons
	DESK_DIR=${pkgdir}/usr/share/applications

	install -d ${BIN_DIR} ${CONFIG_DIR} ${ICON_DIR} ${DESK_DIR}

	install -D COPYING ${CONFIG_DIR}
	install -D formatx.desktop ${DESK_DIR}
	install -D warning.png eraser_exclamation.png ${ICON_DIR}
	install -D formatx.sh ${BIN_DIR}
}


md5sums=('cbbf99f4b80aea350c0d689fa4ea9375')
