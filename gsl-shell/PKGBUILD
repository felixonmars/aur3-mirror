# Maintainer: DevRandom (jruffin at gmail dot com)
# Contributor: Benjamin Chretien (chretien at lirmm dot fr)
# Contributor: perlawk
pkgname=gsl-shell
pkgver=2.3.1
pkgrel=2
pkgdesc="Offers an interactive Lua scripting interface to the GSL collection of mathematical functions." 
url="http://www.nongnu.org/gsl-shell/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gsl' 'agg' 'fox')
provides=('gsl-shell')
conflicts=('gsl-shell')
optdepends=("openblas: improve the speed for operation on large matrices"
            "atlas-lapack: improve the speed for operation on large matrices")

source=("http://download.savannah.gnu.org/releases/gsl-shell/gsl-shell-2.3.1.tar.gz" "cblas.patch" "gslcblas.patch")

md5sums=('f82a74aa8ff8a3969755a104adc94c83'
         'c517abf404bd79ca28d0e5be84eb8f91'
         '686c44873fffcd9059f27d66cb0564a9')

build() {

    cd "$srcdir"/"$pkgname-$pkgver"

    msg "Patching makepackages to fix linkage error..."
    _test_openblas=`pacman -Qqs openblas` || true
    _test_atlas=`pacman -Qqs atlas-lapack` || true
    if [[( -n "$_test_openblas" ) || ( -n "$_test_atlas" )]] ; then
      msg "Using ATLAS BLAS or OpenBLAS implementation"
      patch -p1 < ../cblas.patch
    else
      msg "Using GSL BLAS implementation"
      patch -p1 < ../gslcblas.patch
    fi

    msg "Configuring installation"
    sed -i -e "s|PREFIX=.*$|PREFIX=/usr|" makeconfig
    sed -i -e "s|DESTDIR=.*$|DESTDIR=$pkgdir|" makeconfig

    # The library dependencies are not handled too well in the Makefile.
    # Building the package with -j8 in the make options tends failing
    # because several libs get linked before they are built.
    # We work around this by building the package in a non-parallel manner.
    msg "Building gsl-shell"
    make -j1

}
package() {
    cd "$srcdir"/"$pkgname-$pkgver"
    make install
}
