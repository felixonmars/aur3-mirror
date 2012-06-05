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
makedepends=(cmake perl)
source=(http://amusecode.org/releases/${basename}-${pkgver}.tar.gz)
md5sums=('7da3af3eb16cc41ebe67d925e726bb90')

HARDCODED_FILES="amuse.cfg amuse.sh config.status iamuse.sh ibis-deploy.sh"
INSTALLDIR="${pkgdir}/opt/${pkgname}"

build() {
  cd "${srcdir}/${basename}-${pkgver}"
  export PYTHON="/usr/bin/python2"
  ./configure --prefix=/usr
  make
}

package() {
  mkdir -p "$INSTALLDIR"
  cd "${srcdir}/${basename}-${pkgver}"
  CURDIR=$(pwd)
  CURDIR="$(echo "$CURDIR" | sed 's/[/]/\\\//g')"
  INSTALLDIR="$(echo "$INSTALLDIR" | sed 's/[/]/\\\//g')"
  for file in $HARDCODED_FILES; do
    perl -pi -e "s/$CURDIR/$INSTALLDIR/g" $file
  done
  cp -r * "$INSTALLDIR"
}
