# Contributor : Mark E. Lee <mark@markelee.com>
# Maintainer  : Mark E. Lee <mark@markelee.com>

## LOG :
## 7/11/2013 : Added "openmpi" as a conflicting package at the suggestion of jedbrown
pkgname='mpich3'
pkgdesc='MPICH is a high-performance and widely portable implementation of the Message Passing Interface (MPI) standard (MPI-1, MPI-2 and MPI-3)'
pkgver=3.1.3
pkgrel=1
arch=('any')
license=('custom')
url='http://www.mpich.org'
source=("http://www.mpich.org/static/tarballs/${pkgver}/mpich-${pkgver}.tar.gz")
md5sums=('93cb17f91ac758cbf9174ecb03563778')
makedepends=('gcc' 'gcc-fortran')
conflicts=('openmpi')

build() {
  cd "${srcdir}";  ## enter the source directory
  cd mpich*/;  ## enter the mpich directory
  
  ./configure --prefix="/usr" \
              --exec-prefix="/usr/lib" \
              --bindir="/usr/bin" \
              --sbindir="/usr/sbin" \
              --sysconfdir="/etc/mpich" \
              --includedir="/usr/include/mpich" \
              --libdir="/usr/lib/mpich" \
              --enable-shared \
              --enable-fast=all,O3
              
  make clean && make;  ## clean the compilation directory before compiling
}

package() {
  cd "${srcdir}";  ## enter the source directory
  cd mpich*/;  ## enter the mpich directory
  make DESTDIR=${pkgdir} install;  ## install to the ${pkgdir}
}
