# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=qglk
pkgver=0.1.0
pkgrel=2
pkgdesc="Qglk is an implementation of glk using Qt. Included IF interpreters are glulxe, nitfol, magnetic and level9."
arch=(i686 x86_64)
url="http://www.bubblycloud.com/qglk/"
license=('GPL')
source=(http://www.bubblycloud.com/qglk/${pkgname}-src-${pkgver}.tar.gz
http://mirror.ifarchive.org/if-archive/magnetic-scrolls/interpreters/magnetic/Magnetic23Src.zip
http://mirror.ifarchive.org/if-archive/level9/interpreters/level9/Level9_4.1_Source.zip)



md5sums=('82c704b480d150b25e4b35c021a2d94c'
         '74b0d027c6a70e39d9447f12c215e8a9'
         '820b4eac7b80aea134ede8194301f8b9')

build() {
#creating the qglk lib
	cd $srcdir/${pkgname}-src-${pkgver}
	qmake -config dist
	
#compiling glulxe and nitfol
	make || return 1
    cd $srcdir/${pkgname}-src-${pkgver}/terps
    make || return 1
    
#compiling magnetic
	unzip $srcdir/../Magnetic23Src.zip -d $srcdir/${pkgname}-src-${pkgver}/terps/magnetic 
	cd $srcdir/${pkgname}-src-${pkgver}/terps/magnetic/Glk

	make GLKINCDIR=$srcdir/${pkgname}-src-${pkgver}/include GLKLIBDIR=$srcdir/${pkgname}-src-${pkgver}/lib GLKMAKEINC=$srcdir/${pkgname}-src-${pkgver}/include/Make.qglk -f Makefile.glk glkmagnetic

#compiling level9
	unzip $srcdir/../Level9_4.1_Source -d $srcdir/${pkgname}-src-${pkgver}/terps/level9 
	cd $srcdir/${pkgname}-src-${pkgver}/terps/level9/Glk

	make GLKINCDIR=$srcdir/${pkgname}-src-${pkgver}/include GLKLIBDIR=$srcdir/${pkgname}-src-${pkgver}/lib GLKMAKEINC=$srcdir/${pkgname}-src-${pkgver}/include/Make.qglk -f Makefile.glk glklevel9
}


package() {
	
	mkdir -p $pkgdir/usr/share/${pkgname}
	mkdir -p $pkgdir/usr/bin/
	
	cp -fr $srcdir/${pkgname}-src-${pkgver}/doc $pkgdir/usr/share/${pkgname}/
	cp -fr $srcdir/${pkgname}-src-${pkgver}/include $pkgdir/usr/share/${pkgname}/
	cp -fr $srcdir/${pkgname}-src-${pkgver}/lib $pkgdir/usr/share/${pkgname}/
	echo -e "see http://www.gnu.org/licenses/gpl-2.0.txt" > $pkgdir/usr/share/${pkgname}/doc/gpl-2.txt
	echo -e "see http://www.gnu.org/licenses/lgpl-2.1.txt" > $pkgdir/usr/share/${pkgname}/doc/lgpl-2.1.txt
	
	echo -e "\n- Magnetic (http://www.ifarchive.org/indexes/if-archiveXmagnetic-scrollsXinterpretersXmagnetic.html) \n- Level9 (http://www.ifarchive.org/indexes/if-archiveXlevel9XinterpretersXlevel9.html)" >> $pkgdir/usr/share/${pkgname}/doc/licensing.txt
	
	cp $srcdir/${pkgname}-src-${pkgver}/terps/nitfol/qglk-nitfol $pkgdir/usr/share/${pkgname}/
	cp $srcdir/${pkgname}-src-${pkgver}/terps/glulxe/glulxe $pkgdir/usr/share/${pkgname}/qglk-glulxe
	cp $srcdir/${pkgname}-src-${pkgver}/terps/magnetic/Glk/glkmagnetic $pkgdir/usr/share/${pkgname}/qglk-magnetic
	cp $srcdir/${pkgname}-src-${pkgver}/terps/level9/Glk/glklevel9 $pkgdir/usr/share/${pkgname}/qglk-level9
	
	ln -s /usr/share/qglk/qglk-nitfol $pkgdir/usr/bin/
	ln -s /usr/share/qglk/qglk-glulxe $pkgdir/usr/bin/
	ln -s /usr/share/qglk/qglk-magnetic $pkgdir/usr/bin/
	ln -s /usr/share/qglk/qglk-level9 $pkgdir/usr/bin/

}
