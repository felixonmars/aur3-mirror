# Manteiner: Elia Notarangelo < elia dot notarangelo at gmail dot com>


pkgname=stopwatch-it
pkgver=0.1
pkgrel=1
pkgdesc="Versione in lingua italiana di Stopwatch, programma cronometro e timer che utilizza il toolkit Tk. Ha un grado di precisione al millisecondo"
arch=('any')
url="http://expect.nist.gov/stopwatch/"
license=('GPL')
depends=('tk')
source=("http://master.dl.sourceforge.net/project/archmind/stopwatch-it/$pkgname-$pkgver.tar.gz")


build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	BIN_DIR=${pkgdir}/usr/bin
	DOC_DIR=${pkgdir}/usr/share/doc/stopwatch-it
	MAN_DIR=${pkgdir}/usr/share/man/man1
	ICON_DIR=${pkgdir}/usr/share/pixmaps
	DESK_DIR=${pkgdir}/usr/share/applications

	install -d ${BIN_DIR} ${DOC_DIR} ${MAN_DIR} ${ICON_DIR} ${DESK_DIR}

	install -D copyright index.html README ${DOC_DIR}
	install -D stopwatch-it.1x.gz ${MAN_DIR}
	install -D stopwatch-it.desktop ${DESK_DIR}
	install -D stopwatch.xpm ${ICON_DIR}
	install -D stopwatch-it ${BIN_DIR}
}


md5sums=('4b423d58be4c86682667fb9e710a459f')
