# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmer_hutiter
pkgver=5.4.0
pkgrel=1
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
url='http://www.csc.fi/elmer/'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('gcc-fortran' 'blas')
source=("ftp://ftp.funet.fi/pub/sci/physics/elmer/src/hutiter-$pkgver.tar.gz")
md5sums=('a6a127e75292173328293922e4788b33')

build(){
	cd hutiter-$pkgver

	export F77=gfortran
	export FC=gfortran
	./configure --prefix=/opt/elmer || return 1

	make || return 1

	make DESTDIR="$pkgdir" install || return 1
}
