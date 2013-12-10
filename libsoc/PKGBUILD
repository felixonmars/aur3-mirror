# Maintainer: Jack Mitchell <jack@embed.me.uk>

pkgname=libsoc
pkgver=0.5
pkgrel=1
pkgdesc="a C library for interfacing with common SoC peripherals through generic kernel interfaces"
arch=(x86_64 i686 arm)
url="https://github.com/jackmitch/libsoc"
license=(LGPLv2.1)
depends=()

_gitname='libsoc'
source=("git+http://github.com/jackmitch/libsoc.git#commit=e5846ca199316603f0fec0748c57a781ced46950")
sha256sums=("SKIP")

pkgver() {
  cd $_gitname
}

build() {
  cd $_gitname

  ./autogen.sh 
  ./configure --prefix=/usr \
		--enable-debug 
  make
}

package() {
  cd $_gitname

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

