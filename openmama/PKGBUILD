# Maintainer: Rafal Mielniczuk <rafalm3@gmail.com>
pkgname=openmama
pkgver=1.1
pkgrel=3
pkgdesc="High performance Middleware Agnostic Messaging API that provides a consistent abstraction layer over a variety of message oriented middlewares."
arch=('i686' 'x86_64')
url="http://www.openmama.org/"
license=('LGPL3')
depends=('avis-client' 'util-linux')
optdepends=('gtest')
options=('!libtool')
source=("http://www.openmama.org/sites/openmama.org/files/$pkgname-src-$pkgver.tar.bz2")
md5sums=('8fcb368cf58b383d029f5a6cdf893d74')

build() {  
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/opt/openmama --avis-path=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}  
