# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Matthias Maennich <arch@maennich.net>
pkgname=shibokengenerator
pkgver=1.1.1
pkgrel=1
_pyver=2.7
_qtver=4.8
pkgdesc="Support library for Python bindings"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.pyside.org"
depends=("python2>=$_pyver" "qt>=${_qtver}" 'openssl' 'generatorrunner>=0.6.16')
makedepends=('cmake' 'automoc4')
conflicts=('shiboken')
source=("http://www.pyside.org/files/shiboken-$pkgver.tar.bz2")
md5sums=('fa451b6c4f3e06cce283a84550a96fd2')

build(){
    cd $srcdir/shiboken-$pkgver
    mkdir -p build && cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr  \
              -DCMAKE_BUILD_TYPE=Release   \
              -DBUILD_TESTS=OFF            \
              -DPYTHON_EXECUTABLE=/usr/bin/python$_pyver
    make shiboken
}

package(){
    cd $srcdir/shiboken-$pkgver/build/generator
    make DESTDIR=$pkgdir install

    mkdir -m 755 -p $pkgdir/usr/lib/cmake/Shiboken-$pkgver/
    install -m 755 ../data/ShibokenConfig.cmake $pkgdir/usr/lib/cmake/Shiboken-$pkgver/
    install -m 755 ../data/ShibokenConfigVersion.cmake $pkgdir/usr/lib/cmake/Shiboken-$pkgver/
    install -m 755 ../data/ShibokenConfig-python$_pyver.cmake $pkgdir/usr/lib/cmake/Shiboken-$pkgver/

    mkdir -m 755 -p $pkgdir/usr/lib/pkgconfig/
    install -m 755 ../data/shiboken.pc $pkgdir/usr/lib/pkgconfig/
}
