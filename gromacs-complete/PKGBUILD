# PKGBUILD template to install Gromacs > 4.5 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=gromacs-complete
pkgver=4.5.5
pkgrel=2
pkgdesc="A fast Molecular Dynamics program based on the GROMOS force field. Package providing the lastest stable version. Compiled in Single and Double precission"
url="http://www.gromacs.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('fftw' 'perl' 'libxml2')
makedepends=('cmake')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-$pkgver.tar.gz)
md5sums=('6a87e7cdfb25d81afa9fea073eb28468')

build() {
  cd ${srcdir}
  mkdir build-single
  cd build-single
  cmake ../gromacs-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-$pkgver
  make
  cd ${srcdir}
  mkdir build-double
  cd build-double
  cmake ../gromacs-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-$pkgver \
    -DGMX_DOUBLE=ON
  make

}

package() {
  cd ${srcdir}/build-single 
  make DESTDIR=${pkgdir} install
  cd ${srcdir}/build-double
  make DESTDIR=${pkgdir} install
}

