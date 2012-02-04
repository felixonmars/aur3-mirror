# Maintainer: Tobias T. <OldShatterhand at gmx-topmail dot de>

pkgname=clucene-old
pkgname1=clucene
pkgver=0.9.21b
pkgrel=1
pkgdesc="A C++ port of Lucene: the high-performance, full-featured text search engine"
arch=('i686' 'x86_64')
url="http://clucene.sourceforge.net"
license=('APACHE' 'LGPL')
depends=('gcc-libs' 'zlib' 'boost-libs')
makedepends=('boost')
conflicts=('clucene')
provides=('clucene=0.9.21b')
source=("http://downloads.sourceforge.net/$pkgname1/$pkgname1-core-$pkgver.tar.gz")
md5sums=('cfe15e97bbee769a4823b7a82d137b18')

build() {
cd "${srcdir}"
mkdir build
cp -r ./$pkgname1-core-$pkgver/* ./build/
cd build
./configure --prefix=/usr 
make
}

package() {
cd "${srcdir}"/build  
make DESTDIR="${pkgdir}" install
}
