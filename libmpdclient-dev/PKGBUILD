pkgname=libmpdclient-dev
pkgver=2.0
pkgrel=1
pkgdesc="A stable, documented, asynchronous API library for interfacing MPD in the C, C++ & Objective C languages."
arch=('x86_64')
url="http://mpd.wikia.com/wiki/ClientLib:libmpdclient"
license=('GPL2')
depends=('glibc')
provides=('libmpdclient')
conflicts=('libmpdclient')
source=(http://downloads.sourceforge.net/project/musicpd/libmpdclient/$pkgver/libmpdclient-$pkgver.tar.bz2)
md5sums=('d9605332d4c4a4f28362e4a9c953e84b')

build() {
  cd "$srcdir/libmpdclient-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
