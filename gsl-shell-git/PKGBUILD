# Maintainer: Benjamin Chretien (chretien at lirmm dot fr)
# Contributor: DevRandom (jruffin at gmail dot com)
# Contributor: perlawk
pkgname=gsl-shell-git
pkgver=20130530
pkgver() {
    date +%Y%m%d
}
pkgrel=2
pkgdesc="Offers an interactive Lua scripting interface to the GSL collection of mathematical functions. Git version." 
url="http://www.nongnu.org/gsl-shell/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gsl' 'agg' 'fox' 'freetype2')
makedepends=('git')
provides=('gsl-shell')
conflicts=('gsl-shell')
optdepends=("openblas: improve the speed for operation on large matrices"
            "atlas-lapack: improve the speed for operation on large matrices")
source=("cblas.patch" "gslcblas.patch")
md5sums=('c517abf404bd79ca28d0e5be84eb8f91'
         '686c44873fffcd9059f27d66cb0564a9')

_gitroot="git://github.com/franko/gsl-shell.git"
_gitname="gsl-shell"

build() {
    msg "Connecting to Git server"

    if [ -d ${srcdir}/${_gitname} ] ; then
        # Update local files (including submodules)
        cd ${srcdir}/${_gitname} && git pull origin master || return 1
        msg "The local files are updated."
    else
        # Clone repository and submodules
        git clone --depth 1 ${_gitroot} ${srcdir}/${_gitname} || return 1
    fi

    cd "$srcdir/$_gitname"

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
    # because LuaJIT2 and libagg get linked before they are built.
    # We work around this by building them explicitly before the rest.
    msg "Building gsl-shell"
    make -j1 luajit2 && make -j1 agg-plot && make
}
package() {
    cd "$srcdir/gsl-shell"
    make install
}
