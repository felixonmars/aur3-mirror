# Contributor: oldbay <old_bay@mail.ru>

pkgname=pdfedit-tools-nogui
_srcname=pdfedit
pkgver=0.4.5
pkgrel=cvs
pkgdesc="tools from pdfedit, for packet convert pdf"
arch=('i686' 'x86_64')
url="http://pdfedit.petricek.net/index_e.html"
license=('GPL')
depends=('t1lib' 'gsfonts' 'boost')
makedepends=('cvs' 'doxygen' 'autoconf')
conflicts=('pdfedit' 'pdfedit-addscript' 'pdfedit-addscript-csv')
source=('src_tools_Makefile' 'Makefile.flags.in' 'configure.in' 'displayparams.h')

build() {
	cvs -z3 -d:pserver:anonymous@pdfedit.cvs.sourceforge.net:/cvsroot/pdfedit co -P pdfedit
	cd ${srcdir}/${_srcname}

	rm ${srcdir}/${_srcname}/configure.in
	cp ${srcdir}/configure.in ${srcdir}/${_srcname}/configure.in
	
	rm ${srcdir}/${_srcname}/Makefile.flags.in
	cp ${srcdir}/Makefile.flags.in ${srcdir}/${_srcname}/Makefile.flags.in
	
	rm ${srcdir}/${_srcname}/src/kernel/displayparams.h
	cp ${srcdir}/displayparams.h ${srcdir}/${_srcname}/src/kernel/displayparams.h
	
	rm ${srcdir}/${_srcname}/src/tools/Makefile
	cp ${srcdir}/src_tools_Makefile ${srcdir}/${_srcname}/src/tools/Makefile
	
	cd ${srcdir}/${_srcname}
	sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' src/xpdf/xpdf/GlobalParams.cc || return 1
	autoconf
	./configure --disable-gui --enable-pdfedit-core-dev --enable-tools --prefix=/usr --with-qmake=/opt/qt/bin/qmake
	make || return 1
}

package() {
	cd ${srcdir}/${_srcname}

	make INSTALL_ROOT=${pkgdir} install

	install -D -m755 ${srcdir}/${_srcname}/src/tools/add_image ${pkgdir}/usr/bin/add_image
	install -D -m755 ${srcdir}/${_srcname}/src/tools/add_text ${pkgdir}/usr/bin/add_text
	install -D -m755 ${srcdir}/${_srcname}/src/tools/delinearizator ${pkgdir}/usr/bin/delinearizator
	install -D -m755 ${srcdir}/${_srcname}/src/tools/displaycs ${pkgdir}/usr/bin/displaycs
	install -D -m755 ${srcdir}/${_srcname}/src/tools/flattener ${pkgdir}/usr/bin/flattener
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pagemetrics ${pkgdir}/usr/bin/pagemetrics
	install -D -m755 ${srcdir}/${_srcname}/src/tools/parse_object ${pkgdir}/usr/bin/parse_object
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pdf_images ${pkgdir}/usr/bin/pdf_images
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pdf_object_comparer ${pkgdir}/usr/bin/pdf_object_comparer
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pdf_object_printer ${pkgdir}/usr/bin/pdf_object_printer
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pdf_page_from_ref ${pkgdir}/usr/bin/pdf_page_from_ref
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pdf_page_to_ref ${pkgdir}/usr/bin/pdf_page_to_ref
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pdf_to_bmp ${pkgdir}/usr/bin/pdf_to_bmp
	install -D -m755 ${srcdir}/${_srcname}/src/tools/pdf_to_text ${pkgdir}/usr/bin/pdf_to_text
	install -D -m755 ${srcdir}/${_srcname}/src/tools/replace_text ${pkgdir}/usr/bin/replace_text
}

md5sums=('9b9d922f8373f4c43d96d87055721874'
         '6751b2282c7252c1e0d6cf2208aeb3f4'
         '786c640496d024a3152d1d5628e65a3a'
         '00d5093d67a8a7cd76f0bfb028b817e4')
