# Maintainer: Jeff Ames <jeff@amesign.com>
pkgname=amuse-mpich
basename=amuse
pkgver=5.2
pkgrel=1
pkgdesc="Framework for large-scale simulations of dense stellar systems"
arch=('i686' 'x86_64')
url="http://amusecode.org/"
license=('GPL')
depends=(curl gcc-fortran gettext zlib python2 python2-numpy hdf5 python2-h5py docutils mpich2 python2-mpi4py python2-nose fftw gsl)
makedepends=(cmake)
source=(http://amusecode.org/releases/${basename}-${pkgver}.tar.gz)
md5sums=('7da3af3eb16cc41ebe67d925e726bb90')

build() {
  cd "${srcdir}/${basename}-${pkgver}"
  export PYTHON="/usr/bin/python2"
  ./configure --prefix=/usr
  make
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/${basename}-${pkgver}"
  cp -r * "${pkgdir}/opt/${pkgname}"
}
