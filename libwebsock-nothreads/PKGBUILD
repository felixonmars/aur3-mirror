# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=libwebsock-nothreads
pkgver=1.0.4
pkgrel=1
pkgdesc="C library for easy WebSockets servers. Legacy version without threads support."
arch=('i686' 'x86_64')
url="http://github.com/payden/libwebsock"
license=('LGPL3')
depends=('libevent')
makedepends=('git' 'libtool' 'automake' 'autoconf' 'gcc' 'make')
provides=(libwebsock)

source=('https://github.com/payden/libwebsock/archive/v1.0.4.zip')
md5sums=('8d9af184f425c1d1ebb270ede46eeb4b')
sha256sums=('23b45d3a278c01203039147ac66d320f6a061a9fa7e1cef863ae3f73a2b598f0')
_realname="libwebsock"

build() {
  cd "$srcdir/${_realname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() { 
  cd "$srcdir/${_realname}-${pkgver}"
  DESTDIR="$pkgdir/" make install
} 

