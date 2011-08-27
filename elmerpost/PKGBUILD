# Contributor: Christoph Siegenthaler < csi@gmx.ch >
pkgname=elmerpost
pkgver=5.2.0
pkgrel=4
pkgdesc="Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver"
depends=('elmer_fem')
makedepends=('gcc-fortran')
url="http://www.csc.fi/elmer/"
source=(ftp://ftp.funet.fi/pub/sci/physics/elmer/src/${pkgname}-${pkgver}.tar.gz elmerpost \
	copy.patch sico2elmer queryglxext)
md5sums=('b9478e412e62a28196760624b97bfed3' '1467e8b4b5e3ab494dac16e4b400f6d4' \
	'f65422b491c009e2dd0b988082288dd0' '290912461c09fa297b58de39ddb0c246' \
	'fdae7f5b7890b45424ee5963607882e5')

build(){
	mkdir -p $startdir/pkg/opt/elmer/bin
	mkdir -p $startdir/pkg/opt/elmer/share/elmerpost/{tcl,modules,lib,help}
	mkdir -p $startdir/pkg/usr/bin
	cd $startdir/src/${pkgname}-${pkgver}
	
	patch -p1 -i ../copy.patch
	
	export FC=gfortran
	export F77=gfortran

	sed -i "s#STARTDIR#$startdir#" $startdir/src/${pkgname}-${pkgver}/src/Makefile.in

	./configure --prefix=/opt/elmer || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
	install -c -m 755 $startdir/src/elmerpost $startdir/pkg/usr/bin
	install -c -m 755 $startdir/src/sico2elmer $startdir/pkg/usr/bin
	install -c -m 755 $startdir/src/queryglxext $startdir/pkg/usr/bin
}
