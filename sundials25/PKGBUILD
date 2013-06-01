pkgname=sundials25
_pkgname=sundials
pkgver=2.5.0
pkgrel=1
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
provides=('sundials')
conflicts=('sundials')
options=('!libtool' '!emptydirs')
#source=("http://computation.llnl.gov/casc/sundials/download/code/$_pkgname-$pkgver.tar.gz")


build() {
	wget http://computation.llnl.gov/casc/sundials/download/code/${_pkgname}-${pkgver}.tar.gz
cd ${srcdir}
tar -xzf ${srcdir}/${_pkgname}-${pkgver}.tar.gz
  cd "$_pkgname-$pkgver"

  ./configure F77=gfortran --prefix=/usr --disable-mpi --with-cflags=-fPIC --enable-shared
  make || return 1
 sudo  make prefix="/usr" install
}
