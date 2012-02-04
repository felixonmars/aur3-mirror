# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=boost.reflect
pkgver=20111020
pkgrel=1
arch=('any')
url="https://github.com/bytemaster/boost_reflect"
pkgdesc="C++ Reflection Library"
depends=('boost')
makedepends=('graphviz')
license=('unknown')

_gitroot=git://github.com/bytemaster/boost_reflect.git
_gitname="${srcdir}/boost_reflect"

build() {
    cd $srcdir
    rm -rf $_gitname
    git clone --depth=1 $_gitroot $_gitname

    mkdir -p $pkgdir/usr/share/doc/
    cd $_gitname/doc
    doxygen doxygen.cfg
    mv doc/html $pkgdir/usr/share/doc/boost_reflect

    rm -rf $_gitname/include/[^boost]*
    mv $_gitname/include $pkgdir/usr

}
