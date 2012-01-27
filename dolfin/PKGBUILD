# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=dolfin
pkgver=1.0.0
pkgrel=2
pkgdesc="the C++/Python interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations."
arch=(any)
url="http://launchpad.net/dolfin"
license=('GPL')
groups=('fenics')
# From ubuntu package: cdbs (>= 0.4.90~) pkg-config, libsuitesparse-dev
depends=('python2' 'python2-numpy' 'boost' 'libxml2' 'scotch' 'petsc' 'slepc' 'lapack' 'blas' 'ufc' 'trilinos' 'armadillo' 'cgal')
makedepends=('cmake' 'swig')
options=(!emptydirs)
source=($url/1.0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f2d27de414c2e1768a03464bb38fef38')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    find ${srcdir} -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

    [[ -e build ]] || mkdir build 
    cd build

    cmake .. -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
	-DCMAKE_INSTALL_PREFIX=${pkg}/usr \
	-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
	-DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
        -DPYTHON_LIBRARY:FILEPATH=/usr/lib/libpython2.7.so \
	-DDOLFIN_ENABLE_MPI=ON

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/build
    make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et: