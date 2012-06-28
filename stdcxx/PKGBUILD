# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=stdcxx
pkgver=4.2.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Apache standard C++ library"
url="http://stdcxx.apache.org/"
license=('APACHE')
source=('http://www.apache.org/dist/stdcxx/stdcxx-4.2.1.tar.gz')
md5sums=('4aceb96d3a547e1cbd289dead81d9ea9')

build() {
cd $srcdir/$pkgname-$pkgver
make
}

package() {
  cd $srcdir/build
  mkdir -p $pkgdir/usr/apache
  make install PREFIX=$pkgdir/usr/apache
}
