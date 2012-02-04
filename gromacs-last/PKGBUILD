# PKGBUILD template to install Gromacs > 4.5 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=gromacs-last
pkgver=4.5.4
pkgrel=1
pkgdesc="A fast Molecular Dynamics program based on the GROMOS force field. Package providing the lastest stable version. Compiled only in Single precision only"
url="http://www.gromacs.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('fftw' 'perl' 'libxml2')
makedepends=('cmake')
source=(ftp://ftp.gromacs.org/pub/gromacs/gromacs-$pkgver.tar.gz)
md5sums=('5013de941017e014b92d41f82c7e86d6')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../gromacs-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs/gromacs-$pkgver
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

