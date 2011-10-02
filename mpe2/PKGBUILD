# Maintainer:  Klimov Max <cleemmi@gmail.com>
# Contributor: Klimov Max <cleemmi@gmail.com>

pkgname=mpe2
pkgver=1.3.0
pkgrel=2
pkgdesc="MPI Parallel Environment (MPE) package provides users with a number of useful tools for their MPI programs, such as a set of profiling libraries for collecting information about the behaviour of MPI programs, various viewers for the logfiles and others"
arch=('i686' 'x86_64')
url="http://www.mcs.anl.gov/research/projects/perfvis/software/MPE/index.htm"
license=('custom')

depends=('java-environment' 'openmpi')
makedepends=()
optdepends=()
source=(ftp://ftp.mcs.anl.gov/pub/mpi/mpe/${pkgname}.tar.gz)
md5sums=('67bf0c7b2e573df3ba0d2059a96c2f7b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure MPI_CC=/usr/bin/mpicc CC=gcc MPI_F77=/usr/bin/mpif77 F77=gfortran \
	--prefix=/usr --sysconfdir=/etc/${pkgname} \
	|| return 1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/share/examples/${pkgname}"
  mv ${pkgdir}/usr/share/examples_* ${pkgdir}/usr/share/examples/${pkgname}/
  #License
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp src/slog2sdk/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
