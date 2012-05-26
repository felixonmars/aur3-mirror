# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Matthias Maennich <arch@maennich.net>
pkgname=libshiboken
pkgver=1.1.1
pkgrel=1
_pyver=2.7
_qtver=4.8
pkgdesc="Support library for Python bindings"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.pyside.org"
depends=("python2>=${_pyver}" "qt>=${_qtver}" 'openssl')
makedepends=('cmake' 'automoc4' 'generatorrunner>=0.6.16')
conflicts=('shiboken')
source=("http://www.pyside.org/files/shiboken-$pkgver.tar.bz2")
md5sums=('fa451b6c4f3e06cce283a84550a96fd2')

build(){
    cd $srcdir/shiboken-$pkgver
    mkdir -p build && cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr  \
	      -DCMAKE_BUILD_TYPE=Release   \
	      -DBUILD_TESTS=OFF		   \
	      -DPYTHON_EXECUTABLE=/usr/bin/python$_pyver
    make libshiboken
}

package(){
    cd $srcdir/shiboken-$pkgver/build/$pkgname
    make DESTDIR=$pkgdir install
}

