# contributor: Carl Rogers <carl.rogers@gmail.com>
pkgname=(ndarray-svn-127)
pkgver=1
pkgrel=1
pkgdesc="a C++ multidimensional array library designed for NumPy interoperability"
url="http://code.google.com/p/ndarray"
arch=('i686' 'x86_64')
license=('BSD')
depends=(boost boost-libs python2-numpy)
optdepends=('levmar: Levenberg Marquardt optimization routines'
            'eigen2: linear algebra routines for 2D arrays'
            'fftw: build in fft routines')
makedepends=(subversion scons)
conflicts=()
replaces=()
backup=()
source=()

_svntrunk=http://ndarray.googlecode.com/svn/trunk

build() {
    svn checkout $_svntrunk $pkgname
    cd $pkgname
    scons CPPPATH=/usr/include/levmar --prefix=$pkgdir/usr install || exit 1
}

md5sums=()
