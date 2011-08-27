# pkg maintainer cscorley ; cscorley@gmail.com

pkgname=tinycobol-cvs
pkgver=0.64
pkgrel=1
pkgdesc="TinyCOBOL is a effort to develop a free COBOL compiler with basis in COBOL 85 standard. "
url="http://tiny-cobol.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('gcc' 'ncurses' 'db')
makedepends=('flex' 'bison' 'gcc' 'db' 'ncurses' 'gengetopt' 'make' 'coreutils' 'cvs' 'gzip')
arch=('i686')
source=()
md5sums=()

build() {
     cd $srcdir
     cvs -d:pserver:anonymous@tiny-cobol.cvs.sourceforge.net:/cvsroot/tiny-cobol co development
     cd $srcdir/development
     majorver=`cat version.txt | grep TCOB_MAJOR_VERSION= | sed -e 's/TCOB_MAJOR_VERSION=//'`
     minorver=`cat version.txt | grep TCOB_MINOR_VERSION= | sed -e 's/TCOB_MINOR_VERSION=//'`
     patchver=`cat version.txt | grep TCOB_PATCH_LEVEL= | sed -e 's/TCOB_PATCH_LEVEL=//'`
     cvsver="${majorver}.${minorver}.${patchver}"
     
     ./configure --prefix=/usr || return 1
     make || return 1
#compiling in utils
     cd ${srcdir}/development/utils
     make subdirs=cobf2f || return 1

#Installing in compiler
     cd ${srcdir}/development/compiler
     mkdir -p ${pkgdir}/usr/share/htcobol
     mkdir -p ${pkgdir}/usr/bin
     install -c -m 644 htcobolrc ${pkgdir}/usr/share/htcobol/htcobolrc
     install -c -s -m 755 htcobol ${pkgdir}/usr/bin/htcobol

#Installing in lib
     cd ${srcdir}/development/lib
     mkdir -p ${pkgdir}/usr/share/htcobol
     mkdir -p ${pkgdir}/usr/lib
     install -c -m 644 htrtconf ${pkgdir}/usr/share/htcobol/htrtconf
     install -c -m 644 libhtcobol.a ${pkgdir}/usr/lib/libhtcobol.a
     install -c -m 644 libhtcobol.so.${cvsver} ${pkgdir}/usr/lib/libhtcobol.so.${cvsver}
     (cd ${pkgdir}/usr/lib; ln -sf libhtcobol.so.${cvsver} libhtcobol.so;)
     (cd ${pkgdir}/usr/lib; ln -sf libhtcobol.so.${cvsver} libhtcobol.so.0;)

#Installing in cobrun
     cd ${srcdir}/development/cobrun
	install -c -s -m 755 htcobrun ${pkgdir}/usr/bin/htcobrun

#Installing in test.code/copybooks
     cd ${srcdir}/development/test.code/copybooks
     mkdir -p ${pkgdir}/usr/share/htcobol/copybooks

#Installing in info
     cd ${srcdir}/development/info
     cp -f htcobol_en.man htcobol.1
     gzip -f htcobol.1
     cp -f htcobrun_en.man htcobrun.1
     gzip -f htcobrun.1
     mkdir -p ${pkgdir}/usr/man/man1
     install -c -m 644 htcobol.1.gz ${pkgdir}/usr/man/man1/htcobol.1.gz
     install -c -m 644 htcobrun.1.gz ${pkgdir}/usr/man/man1/htcobrun.1.gz
     cp -f htcobol_en.html htcobol.html
     cp -f htcobrun_en.html htcobrun.html
     mkdir -p ${pkgdir}/usr/doc/htcobol-${cvsver}
     install -c -m 644 htcobol.html ${pkgdir}/usr/doc/htcobol-${cvsver}/htcobol.html
     install -c -m 644 htcobrun.html ${pkgdir}/usr/doc/htcobol-${cvsver}/htcobrun.html

#Installing in cobf2f
     cd ${srcdir}/development/utils/cobf2f
     install -c -m 755 htcobf2f ${pkgdir}/usr/bin/htcobf2f

#Installing the docs
     cd ${srcdir}/development

     install -c -m 644 README ${pkgdir}/usr/doc/htcobol-${cvsver}/README
     install -c -m 644 AUTHORS ${pkgdir}/usr/doc/htcobol-${cvsver}/AUTHORS
     install -c -m 644 COPYING ${pkgdir}/usr/doc/htcobol-${cvsver}/COPYING
     install -c -m 644 COPYING.LIB ${pkgdir}/usr/doc/htcobol-${cvsver}/COPYING.LIB
     install -c -m 644 COPYRIGHT ${pkgdir}/usr/doc/htcobol-${cvsver}/COPYRIGHT
     install -c -m 644 INSTALL ${pkgdir}/usr/doc/htcobol-${cvsver}/INSTALL
     install -c -m 644 STATUS ${pkgdir}/usr/doc/htcobol-${cvsver}/STATUS
     install -c -m 644 HISTORY ${pkgdir}/usr/doc/htcobol-${cvsver}/HISTORY

}
