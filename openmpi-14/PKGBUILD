# Maintainer: Simon Chambers <mail@simonchambers.org>
# Adapted from PKGBUILD by Stéphane Gaudreault <stephane@archlinux.org>
pkgname=openmpi-14
_pkgname=openmpi
pkgver=1.4.3
pkgrel=2
pkgdesc="High performance message passing library (MPI) - Version 1.4 (Stable)"
arch=('i686' 'x86_64')
url="http://www.open-mpi.org"
license=('custom')
depends=('gcc' 'gcc-fortran' 'openssh' 'valgrind' 'libtool' 'hwloc')
options=(!libtool)
provides=('openmpi')
source=(http://www.open-mpi.org/software/ompi/v1.4/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha1sums=('9d24b6969d73605904855eb32d40d6b07e231932')

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"

   ./configure --prefix=/usr \
               --sysconfdir=/etc/${_pkgname} \
               --mandir=/usr/share/man \
               --enable-mpi-f90 \
               --libdir=/usr/lib/${_pkgname} \
               --with-threads=posix \
               --enable-mpi-threads \
               --enable-smp-locks \
               --with-valgrind \
               --enable-memchecker \
               --enable-debug \
               --enable-pretty-print-stacktrace \
               --without-slurm \
               --with-hwloc=external \
               --with-libltdl=/usr \
		--enable-heterogeneous \
               FC=/usr/bin/gfortran \
               LDFLAGS='-Wl,-z,noexecstack'

   make
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install

   # Openmpi's otfinfo conflicts with the one from texlive
   mv "${pkgdir}"/usr/bin/otfinfo "${pkgdir}"/usr/bin/otfinfompi

   # Openmpi's otfdump conflicts with the one from libotf
   mv "${pkgdir}"/usr/bin/otfdump "${pkgdir}"/usr/bin/otfdumpompi

   install -d -m 755 "${pkgdir}"/etc/ld.so.conf.d
   echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf

   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
