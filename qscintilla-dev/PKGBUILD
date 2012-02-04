# QScintilla (Dev): Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

filename=qscintilla
pkgname=${filename}-dev
realname=QScintilla
pkgver=2.4.6
#pkgdate=a80f0df49f6c
pkgrel=1
pkgdesc="A port to Qt4 of Neil Hodgson's Scintilla C++ editor class.  This is the latest development snapshot."
arch=("i686" "x86_64")
url="http://www.riverbankcomputing.co.uk/software/${filename}/"
license=("GPL3")
provides=("${filename}=${pkgver}")
depends=("qt>=4.6")
conflicts=("${filename}" "${filename}2")
replaces=("${filename}2")
options=(!emptydirs)
#source=("http://riverbankcomputing.com/static/Downloads/${realname}2/${realname}-gpl-snapshot-${pkgver}-${pkgdate}.tar.gz")
source=("http://riverbankcomputing.com/static/Downloads/${realname}2/${realname}-gpl-${pkgver}.tar.gz")
sha1sums=('0527feedf74186a02ca0757d71be0c790149f674')

build() {
	#cd ${srcdir}/${realname}-gpl-snapshot-${pkgver}-${pkgdate}/Qt4
	cd ${srcdir}/${realname}-gpl-${pkgver}/Qt4

	# Build
	qmake ${filename}.pro || return 1
	sed -i 's|$(MOVE) $(TARGET)|$(COPY) $(TARGET)|g' Makefile || return 1
	make || return 1
	make INSTALL_ROOT=${pkgdir} install || return 1

	cd ../designer-Qt4

	# Qt4 designer ${filename}2 plugin
	mkdir -p ${pkgdir}/usr/lib/qt/plugins/designer

	echo "INCPATH += ../Qt4" >> designer.pro || return 1
	sed -i "s|LIBS.*|LIBS += -L../Qt4 -l${filename}2|g" designer.pro || return 1
	qmake designer.pro || return 1
	make || return 1
	cp lib${filename}plugin.so ${pkgdir}/usr/lib/qt/plugins/designer/
}

