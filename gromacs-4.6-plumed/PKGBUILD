# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-4.6-plumed
pkgver=4.6.7
pkgrel=1
pkgdesc='GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. (Plumed patched)'
url='http://www.gromacs.org/'
license=("GPL")
arch=('i686' 'x86_64')
depends=('plumed' 'fftw' 'lesstif' 'perl' 'libxml2' 'libsm' 'libx11')
options=('!libtool')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha1sums=('923ed238963027201c329ff34dbef414fe68f4e9')


export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format). 
prepare() {
  msg2 "Patching plumed for gromacs"
  source /opt/plumed/sourceme.sh
  cd ${srcdir}/gromacs-${pkgver}
  echo 3| plumed patch -p
}

build() {
  source /opt/plumed/sourceme.sh
  mkdir -p ${srcdir}/{single,double}

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-$pkgver-plumed \
    -DBUILD_SHARED_LIBS=ON \
    -DGMX_OPENMP=ON \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_LIBS_SUFFIX=_plumed
  make

  msg2 "Building the doulbe precision files"
  cd ${srcdir}/double
  cmake ../gromacs-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-$pkgver-plumed \
    -DBUILD_SHARED_LIBS=ON \
    -DGMX_OPENMP=ON \
    -DREGRESSIONTEST_DOWNLOAD=ON \
    -DGMX_DOUBLE=ON \
    -DGMX_LIBS_SUFFIX=_plumed_d
  make
}

check () {
  cd ${srcdir}/single
  make test
  cd ${srcdir}/double
  make test
}

package() {
  msg2 "Making the single precision executables"
  cd ${srcdir}/single 
  make DESTDIR=${pkgdir} install

  msg2 "Making the double precision executables"
  cd ${srcdir}/double
  make DESTDIR=${pkgdir} install
}
