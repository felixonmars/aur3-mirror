# Maintainer: Matthias Maennich <arch@maennich.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=pyside-tools
pkgver=0.2.13
pkgrel=5
_pyver=2.7
pkgdesc="UI Compiler (pyside-uic) plus Qt Resource Compiler (pyside-rcc4) for PySide."
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.pyside.org"
depends=('pyside>=1.1.0' 'python2')
makedepends=('cmake' 'automoc4' 'shibokengenerator>=1.1.0')
source=("http://www.pyside.org/files/$pkgname-$pkgver.tar.bz2")
md5sums=('14d3a36df06d680357d7bc1960f19a6d')

build(){
    cd $srcdir/$pkgname-$pkgver
    sed -e "s/python/python2/g" pyside-uic > pyside-uic_mod && mv pyside-uic{_mod,} && chmod 755 pyside-uic
    mkdir -p build && cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_BUILD_TYPE=Release \
	      -DSHIBOKEN_PYTHON_SUFFIX=-python$_pyver \
	      -DPYTHON_EXECUTABLE=/usr/bin/python$_pyver
    make
}

package(){
    cd $srcdir/$pkgname-$pkgver/build
	make DESTDIR=$pkgdir install
}
