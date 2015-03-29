# Author: Michael Kapelko <kornerr@gmail.com>
pkgname=ogs-mjin
pkgver=0.6.0
pkgrel=1
pkgdesc="OGS MJIN is a cross-platform game engine for making 3D games; comes with an editor"
arch=('i686' 'x86_64')
url=('https://opengamestudio.org')
license=('Zlib')
depends=('qt5-tools' 'openscenegraph' 'python2' 'ogs-mjin-data')
makedepends=('gcc' 'cmake' 'make' 'openscenegraph' 'qt5-tools' 'swig' 'python2')
source=(http://176.196.60.235/ogs-mjin-0.6.0.tar.bz2)
md5sums=('6bf14dee70d648810e3da07f3339763b')

BUILD=$srcdir/build

build() {
    [[ -d $BUILD ]] && rm -rf $BUILD
    mkdir $BUILD
    cd $BUILD
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr $srcdir/$pkgname-$pkgver
    make
}

package() {
    cd $BUILD
    make DESTDIR=$pkgdir install
    install -d $pkgdir/usr/bin
    echo "#!/bin/bash
python2 /usr/share/ogs-mjin/tools/editor/Editor.py /usr/share/ogs-mjin/resources/editor /usr/share/ogs-mjin/resources/default.ogs" > $pkgdir/usr/bin/ogs-editor
    chmod +x $pkgdir/usr/bin/ogs-editor
}

