# Maintainer: perlawk
# Modified: petecan
pkgname=tisean
_pkgname=TISEAN
pkgver=3.0.1
pkgrel=1
pkgdesc="TISEAN stands for TIme SEries ANalysis, a software project for the analysis of time series with methods based on the theory of nonlinear deterministic dynamical systems, or chaos theory"
url="http://www.mpipks-dresden.mpg.de/~tisean/Tisean_3.0.1/index.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=(gcc-fortran-multilib)
conflicts=()
replaces=()
backup=()
install=tisean.install
source=(http://www.mpipks-dresden.mpg.de/~tisean/TISEAN_3.0.1.tar.gz)
md5sums=('733e585a5125b272618e7e4f98580c5d')

build() {
  cd $startdir/src/Tisean_$pkgver
  export FC=gfortran
  ./configure --prefix=/usr
  make
  sed -i 's/dots 3/dots/g;' examples/project.gnu
}

package() {
  mkdir -p ${pkgdir}/usr/lib/tisean/bin
  cd "${srcdir}/Tisean_${pkgver}/source_c"
  find . -type f -executable -exec cp "{}" ${pkgdir}/usr/lib/tisean/bin \;
  cd "${srcdir}/Tisean_${pkgver}/source_f"
  find . -type f -executable -exec cp "{}" ${pkgdir}/usr/lib/tisean/bin \;
}
