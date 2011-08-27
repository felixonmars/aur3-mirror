# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=open64
pkgver=trunk
pkgrel=1
pkgdesc="Open64 is the final result of research contributions from a number of compiler groups around the world."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.open64.net/home.html"
makedepends=('subversion')
depends=('gcc')

build() {

#_arch=i386 if $ARCH=i686
#_arch=x86_64 if $ARCH=x86_64

if [ "$CARCH" = "x86_64" ]; then
       _arch=x86_64
    else
       _arch=i386
    fi

    svn export https://svn.open64.net/svnroot/open64/trunk open64
    cd $srcdir/open64
    export SHELL=/bin/bash
    mkdir build
    cd build
    ../configure --target=$_arch-unknown-linux-gnu --prefix=$startdir/pkg/opt/open64 --with-build-compiler=GNU
    make all
    make install
}



