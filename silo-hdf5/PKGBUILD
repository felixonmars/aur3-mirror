# Contributor: Brenden Mervin <bmervin@utk.edu>
# Maintainer:  Brenden Mervin <bmervin@utk.edu>
pkgname=silo-hdf5
pkgver=4.9.1
pkgrel=2
pkgdesc="A mesh and field I/O library and scientific database with HDF5 driver"
url="http://silo.llnl.gov"
arch=('x86_64')
license=('BSD')
depends=(hdf5 python2)
makedepends=('gcc' 'gcc-fortran')
conflicts=(silo)
replaces=()
backup=()
source=(https://wci.llnl.gov/codes/silo/silo-$pkgver/silo-$pkgver.tar.gz
        configure.patch)

prepare() {

    # apply patch
    cd "$srcdir/silo-$pkgver"
    if [ -a configure.patch ] ; then
        patch configure -i "$srcdir/configure.patch"
    fi
}

build() {

    # apply patch
    cd $srcdir

    # configure
    export PYTHON=python2 && \
    cd silo-$pkgver || exit 1
    ./configure --prefix=/usr \
                CC=mpicc \
                CXX=mpicxx \
                FC=mpif90 \
                F77=mpif90 \
                CFLAGS="-O2 -fPIC" \
                CXXFLAGS="-O2 -fPIC" \
                FCFLAGS="-O2 -fPIC" \
                FFLAGS="-O2 -fPIC" \
                LIBS="-lstdc++" \
                --with-hdf5=/usr/include,/usr/lib \
                --enable-shared \
                --disable-silex \
                --enable-pythonmodule \
                --enable-optimization

 
    # build
    make || exit 1
}

package() {

    # install the package
    cd "$srcdir/silo-$pkgver" || exit 1
    make DESTDIR=${pkgdir} install || exit 1
    install -m644 -D COPYRIGHT ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('aea6992437e1ed75cddcec1d91c6ff36'
         '3044f834a4930b5b4b2aef42791af492')
