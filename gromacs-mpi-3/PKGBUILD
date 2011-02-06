# $Id: PKGBUILD,v 1.3 2008/12/07 09:40:36 abhidg Exp $
# Maintainer: Eduardo Martins Lopes
# Contributor: Abhishek Dasgupta
# Contributor: Ricardo

pkgname=gromacs-mpi-3
pkgver=3.3.3
pkgrel=1
pkgdesc="A fast Molecular Dynamics program based on the GROMOS force field"
url="http://www.gromacs.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('fftw' 'lesstif' 'openmpi-1.3.1')
options=(!libtool)
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-$pkgver.tar.gz gromacs-mpi-3.install)

build() {
  export CPPFLAGS="-I/usr/include"
  export LDFLAGS="-L/usr/lib"
  mkdir -p ${startdir}/pkg/usr/bin  
  cd $startdir/src/gromacs-${pkgver}/
 
#  cd "$startdir/src/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-shared --enable-mpi --program-suffix=-mpi-3
  make -j3 || return 1
  make DESTDIR="${startdir}/pkg" install || return 1
}
md5sums=('33f5f434d69b45bc51c5af36f5719618' 'c7534a6b00821fbd4073a425dd9ca444')
