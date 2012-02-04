# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmer_mathlibs
pkgver=1.0.0
pkgrel=3
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
url='http://www.csc.fi/elmer/'
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('gcc-fortran')
source=("ftp://ftp.funet.fi/pub/sci/physics/elmer/src/mathlibs-$pkgver.tar.gz")
md5sums=('e8f5e85dc17e857f35879d41f0992f86')

build(){
	cd mathlibs-$pkgver

	export F77=gfortran
	./configure --prefix=/opt/elmer || return 1

	make || return 1

	make DESTDIR="$pkgdir" install || return 1
}
