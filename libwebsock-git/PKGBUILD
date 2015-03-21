# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=libwebsock-git
pkgver=r161.3c1615e
pkgrel=1
pkgdesc="C library for easy WebSockets servers."
arch=('i686' 'x86_64')
url="http://github.com/payden/libwebsock"
license=('LGPL3')
depends=('libevent')
makedepends=('git' 'libtool' 'automake' 'autoconf' 'gcc' 'make')
provides=(libwebsock)

source=('git+http://github.com/payden/libwebsock')
md5sums=('SKIP')
_gitname="libwebsock"

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/${_gitname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() { 
  cd "$srcdir"/${_gitname}
  DESTDIR="$pkgdir/" make install
} 

