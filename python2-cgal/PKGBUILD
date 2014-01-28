# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>
pkgname=python2-cgal
pkgver=20131210
pkgrel=2
pkgdesc="CGAL bindings for Python 2 (This is cgal-bindings, not the obsolete CGAL-Python)"
arch=('i686' 'x86_64')
url="https://code.google.com/p/cgal-bindings/"
license=('Boost Software License')
depends=('eigen>=3.1.0' 'swig' 'cgal>=4.3')
makedepends=('cmake')
source=()
md5sums=()

provides=('python2-cgal')
conflicts=('python2-cgal')
replaces=('python2-cgal')

_gitroot="https://code.google.com/p/cgal-bindings/"
_gitname="cgal-bindings"

build() {
    cd "$srcdir"
    if [ -d $_gitname ]
    then
        cd $_gitname && git fetch
    else
        git clone --branch master $_gitroot $_gitname
    fi
    cd "$srcdir/$_gitname"
    cmake -DPYTHON_LIBRARY=/usr/lib/python2.7/config/libpython2.7.so -DPYTHON_INCLUDE_PATH=/usr/include/python2.7/ -DBUILD_JAVA=OFF
    make -j `nproc`
}

package() {
    cd "$srcdir/$_gitname"
    install -d $pkgdir/usr/lib/python2.7/site-packages/CGAL
    install -t $pkgdir/usr/lib/python2.7/site-packages/CGAL build-python/CGAL/*
}

