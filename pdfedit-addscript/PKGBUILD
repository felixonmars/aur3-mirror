# Contributor: oldbay <old_bay@mail.ru>

pkgname=pdfedit-addscript
_srcname=pdfedit
pkgver=0.4.5
pkgrel=2
pkgdesc="Full featured editor for manipulating PDF documents and console script for convert pdf to txt"
arch=('i686' 'x86_64')
url="http://pdfedit.petricek.net/index_e.html"
license=('GPL')
depends=('qt3' 't1lib' 'gsfonts')
makedepends=('boost' 'doxygen')
conflicts=('pdfedit' 'pdfedit-tools-nogui' 'pdfedit-addscript-csv')
source=(http://downloads.sourceforge.net/pdfedit/${_srcname}-${pkgver}.tar.bz2
	'pdfedit.png' 'pdfedit.desktop' 'savealltext.qs' 'displayparams.h')

build() {
	. /etc/profile.d/qt3.sh
	export PATH=$QTDIR/bin:$PATH
	export QMAKESPEC=$QTDIR/mkspecs/linux-g++

        rm ${srcdir}/${_srcname}-${pkgver}/src/kernel/displayparams.h
        cp ${srcdir}/displayparams.h ${srcdir}/${_srcname}-${pkgver}/src/kernel/displayparams.h

	cd ${srcdir}/${_srcname}-${pkgver}
	sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' src/xpdf/xpdf/GlobalParams.cc || return 1
	./configure --prefix=/usr --with-qmake=/opt/qt/bin/qmake
	make || return 1
}

package() {
	cd ${srcdir}/${_srcname}-${pkgver}

	make INSTALL_ROOT=${pkgdir} install

	install -D -m644 ../pdfedit.desktop ${pkgdir}/usr/share/applications/pdfedit.desktop
	install -D -m644 ../pdfedit.png ${pkgdir}/usr/share/pixmaps/pdfedit.png
	install -D -m644 ../savealltext.qs ${pkgdir}/usr/share/pdfedit/savealltext.qs
}

md5sums=('80502ee7f08cdfb867ffdaa92d160a23'
         '70fd938b2ef9da748a093df7e20d1d7d'
         'c0572c2dd54065322321718aa49ed6b8'
         'a3c5ae67a42e4da31ef890bb84814917'
         '00d5093d67a8a7cd76f0bfb028b817e4')
