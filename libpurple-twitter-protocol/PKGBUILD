# Contributor: lh <jarryson#gmail.com>
pkgname=libpurple-twitter-protocol
pkgver=0.1.3
pkgrel=1
pkgdesc="A libpurple plugin which treats Twitter as a full blown IM protocol."
arch=(i686 x86_64)
url="http://code.google.com/p/libpurple-twitter-protocol/"
license=('GPL')
depends=('pidgin')
makedepends=('pkgconfig')
install=
source=(http://libpurple-twitter-protocol.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('8d68cfe1ed8d3d2173ca28933d8f65cf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
