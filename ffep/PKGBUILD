# Maintainer: 
# Contributor: Christoph Siegenthaler < csi@gmx.ch >

pkgname=ffep
pkgver=0.8.3
pkgrel=3
pkgdesc="A modular designed collection of C libraries"
arch=('i686' 'x86_64')
url="http://www.free-finite-element-package.smial.de"
license=('BSD-style')
depends=('meml')
options=('!libtool')
source=($url/Download/$pkgname-$pkgver.tar.gz)
md5sums=('3acbc27596658c71f508249fa886b0ec')

build(){
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir"/ install
}
