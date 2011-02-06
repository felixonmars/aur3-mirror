##Contributor: T.Cunly

pkgname=stdhep
pkgver=5.06.01
pkgver_=5-06-01
pkgrel=1
license=(GPL)
pkgdesc='StdHep contains a set of translation routines which convert Herwig, Jetset, Isajet, or QQ events to and from the standard HEP event format, using the Particle Data Group numbering scheme. StdHep also contains utility routines to work with the HEPEVT common block and a set of I/O routines. The HEPEVT common block allows 4000 particles per event. The numbering scheme is detailed in the 2006 Edition of the Review of Particle Physics.'
url="http://cepa.fnal.gov/psm/stdhep/"
arch=('x86_64')
##g77自己搞定吧，换个专业点的编译器，或者重新编译gcc34加上f77选项
depend=(cernlib g77 lesstif)

install=stdhep.install
source=(http://cepa.fnal.gov/dist/stdhep/stdhep-5-06-01.tar.gz)

build () {
	cd $srcdir/${pkgname}-${pkgver_}
	
	###加上cernlib编译选项,example文件夹下的cernlib等选项自己按要求修改吧
	sed -i -e '18d' -e '20d' GNUmakefile || return 1
	###share
	sed -i -e "s/#BUILD_SHARED/BUILD_SHARED/" src/stdhep_arch || return 1
	sed -i -e "s/#BUILD_SHARED/BUILD_SHARED/" mcfio/arch_mcfio ||return 1
	
	make
	make clean
	
	###install
	INSTALLDIR=/opt/Science/StdHEP
	
	[ -d $pkgdir$INSTALLDIR ] || mkdir -p $pkgdir$INSTALLDIR
	cp -r * $pkgdir$INSTALLDIR/
}
