# Contributor: Audren Cezar <audrencezar@gmail.com> 

pkgname=tokyocabinet-lua
pkgver=1.8
pkgrel=1
pkgdesc="Lua Binding of Tokyo Cabinet DBM, updated for 5.2"
arch=('i686' 'x86_64')
url="http://tokyocabinet.sourceforge.net"
license=('LGPL')
makedepends=('gcc>=3.1' 'make' 'pkgconfig')
depends=('lua' 'tokyocabinet>=1.4')
source=("http://tokyocabinet.sourceforge.net/luapkg/${pkgname}-${pkgver}.tar.gz")
md5sums=('7f9d1e0dd794cb2d0b89fae946243af4')

prepare() {
  cd "$startdir/src/${pkgname}-${pkgver}"
	sed -i 's/objlen/rawlen/g' tokyocabinet.c
}

build() {
  cd "$startdir/src/${pkgname}-${pkgver}"
  ./configure --prefix=/usr  
	sed -i 's!lua/5.1!lua/5.2!g; s!lua5.1!lua!g;' Makefile
  make -j8
}

package() {
	cd "$startdir/src/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install 
}
