# Maintainer: 
# Contributor: Christoph Siegenthaler < csi@gmx.ch >

pkgname=meml
pkgver=0.7
pkgrel=3
pkgdesc="A modular designed collection of C libraries"
arch=('i686' 'x86_64')
url="http://www.meta-matrix-library.smial.de"
license=('unknown')
depends=('glibc')
options=('!libtool')
source=($url/download/$pkgname-$pkgver.tar.gz)
md5sums=('b01fb2dcab46bd1e9e76d9aabe944ae8')

build(){
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir"/ install
}
