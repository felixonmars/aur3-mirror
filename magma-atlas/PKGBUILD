##### Configuration Options
# Specify GPU compute capability Tesla (1.x) or Fermi (2.x) or Kepler (3.x)
_GPU_TARGET=Tesla
_GPU_TARGET=Fermi
_GPU_TARGET=Kepler
##### End

pkgname=magma-atlas
pkgver=1.6.2
pkgrel=1
pkgdesc="Identical to the magma package, but built on the atlas-lapack package not ACML. (Provides a dense linear algebra library similar to LAPACK but for heterogeneous/hybrid architectures, starting with current 'Multicore+GPU' systems.)"
arch=("i686" "x86_64")
url="http://icl.cs.utk.edu/magma/"
license=(custom)
depends=("cuda>=5.0.0" "atlas-lapack")
makedepends=("binutils" "sed")
options=('staticlibs')
sha1sums=('49fecfc0eeb155268d2d6376854f67669b952f41')
source=("http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/magma-${pkgver}

	# Fix Makefile
	cp make.inc.atlas make.inc
	sed -i "/GPU_TARGET ?=/c GPU_TARGET = ${_GPU_TARGET}" make.inc
	sed -i '/#CUDADIR/c CUDADIR   = /opt/cuda' make.inc
	sed -i '/#LAPACKDIR/c LAPACKDIR   = /usr/lib' make.inc
	sed -i '/#ATLASDIR/c ATLASDIR   = /usr/lib' make.inc
	sed -i 's^-L$(ATLASDIR)/lib^-L$(ATLASDIR)^g' make.inc
	sed -i ':a;N;$!ba;s/\nCFLAGS  /\nCXXFLAGS/g' make.inc
	sed -i 's^-lifcore^^g' make.inc	

	make clean
	make all
	make prefix="${srcdir}/install/" install

	make clean
	sed -i 's^$(FPIC)^-fPIC^g' make.inc
	make shared
	make prefix="${srcdir}/install/" install
}

package() {
	mkdir -p ${pkgdir}/opt/magma/testing
	cp -ru ${srcdir}/magma-${pkgver}/testing/* ${pkgdir}/opt/magma/testing/
	cp -ru ${srcdir}/install/* ${pkgdir}/opt/magma/

	rm -rf ${pkgdir}/opt/magma/lib/pkgconfig	
	mkdir -p ${pkgdir}/usr/share/licenses/magma
	cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma/LICENSE
}
