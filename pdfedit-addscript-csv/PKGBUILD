# Contributor: oldbay <old_bay@mail.ru>

pkgname=pdfedit-addscript-csv
_srcname=pdfedit
pkgver=0.4.5
pkgrel=csv
pkgdesc="Full featured editor for manipulating PDF documents and console script for convert pdf to txt"
arch=('i686' 'x86_64')
url="http://pdfedit.petricek.net/index_e.html"
license=('GPL')
depends=('qt3' 't1lib' 'gsfonts')
makedepends=('cvs' 'boost' 'doxygen' 'autoconf')
conflicts=('pdfedit' 'pdfedit-addscript' 'pdfedit-tools-nogui')
source=('pdfedit.png' 'pdfedit.desktop' 'savealltext.qs' 'displayparams.h')

build() {
	cvs -z3 -d:pserver:anonymous@pdfedit.cvs.sourceforge.net:/cvsroot/pdfedit co -P pdfedit
	. /etc/profile.d/qt3.sh
	export PATH=$QTDIR/bin:$PATH
	export QMAKESPEC=$QTDIR/mkspecs/linux-g++
	
	rm ${srcdir}/${_srcname}/src/kernel/displayparams.h
	cp ${srcdir}/displayparams.h ${srcdir}/${_srcname}/src/kernel/displayparams.h

	cd ${srcdir}/${_srcname}
	sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' src/xpdf/xpdf/GlobalParams.cc || return 1
	autoconf
	./configure --prefix=/usr --with-qmake=/opt/qt/bin/qmake
	make || return 1
}

package() {
	cd ${srcdir}/${_srcname}

	make INSTALL_ROOT=${pkgdir} install

	install -D -m644 ../pdfedit.desktop ${pkgdir}/usr/share/applications/pdfedit.desktop
	install -D -m644 ../pdfedit.png ${pkgdir}/usr/share/pixmaps/pdfedit.png
	install -D -m644 ../savealltext.qs ${pkgdir}/usr/share/pdfedit/savealltext.qs
}

md5sums=('70fd938b2ef9da748a093df7e20d1d7d'
         'c0572c2dd54065322321718aa49ed6b8'
         'a3c5ae67a42e4da31ef890bb84814917'
         '00d5093d67a8a7cd76f0bfb028b817e4')
