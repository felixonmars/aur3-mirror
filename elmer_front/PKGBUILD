# Contributor: Christoph Siegenthaler < csi@gmx.ch >
pkgname=elmer_front
pkgver=5.2.0
pkgrel=4
pkgdesc="Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver"
url="http://www.csc.fi/elmer/"
depends=('elmerpost')
source=(ftp://ftp.funet.fi/pub/sci/physics/elmer/src/front-${pkgver}.tar.gz elmerfront)
md5sums=('073da54efb2130bd07109633e6d5ff31' 'a50c67e8e4748a3c30e0c311fbdd8547')

build(){
	mkdir -p $startdir/pkg/opt/elmer/share/elmerfront/{tcl/images,lib}
	mkdir -p $startdir/pkg/usr/bin
	cd $startdir/src/front-${pkgver}

	# Fix error in source
	sed -i "s#InputFront::storeMatcData#storeMatcData#" $startdir/src/front-${pkgver}/include/ecif_inputFront.h

	# enhence Makefile.in 
	# Delete all mkdir parts
	sed -i "s#mkdir -p \"\${prefix}/share/elmerfront/tcl\"##" $startdir/src/front-${pkgver}/src/Makefile.in
	sed -i "s#mkdir -p \"\${prefix}/share/elmerfront/lib\"##" $startdir/src/front-${pkgver}/src/Makefile.in
	sed -i "s#cp \-r \./tcl/\* \"\${prefix}/share/elmerfront/tcl\"##" $startdir/src/front-${pkgver}/src/Makefile.in
	sed -i "s#cp \-r \./lib/\* \"\${prefix}/share/elmerfront/lib\"##" $startdir/src/front-${pkgver}/src/Makefile.in

	./configure --prefix=/opt/elmer || return 1
	make || return 1

	# Install files
	install -c -m 775 $startdir/src/front-${pkgver}/src/lib/* $startdir/pkg/opt/elmer/share/elmerfront/lib
	install -c -m 775 $startdir/src/front-${pkgver}/src/tcl/*.tcl $startdir/pkg/opt/elmer/share/elmerfront/tcl || return 1
	install -c -m 775 $startdir/src/front-${pkgver}/src/tcl/front.edf $startdir/pkg/opt/elmer/share/elmerfront/tcl || return 1
	install -c -m 775 $startdir/src/front-${pkgver}/src/tcl/images/* $startdir/pkg/opt/elmer/share/elmerfront/tcl/images || return 1

	make DESTDIR=$startdir/pkg install || return 1

	install -c -m 775 $startdir/src/elmerfront $startdir/pkg/usr/bin
}
