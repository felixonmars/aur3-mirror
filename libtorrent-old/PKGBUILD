# Maintainer: Ranmaru <rnkn22 [at] gmail [dot] com>
# Submitter: tjwoosta

pkgname=libtorrent-old
pkgver=0.12.9
pkgrel=1
pkgdesc="BitTorrent library written in C++, older version"
arch=('i686' 'x86_64')
url="http://libtorrent.rakshasa.no"
license=('GPL')
depends=('libsigc++' 'openssl')
options=('!libtool')
source=(http://libtorrent.rakshasa.no/downloads/libtorrent-$pkgver.tar.gz)

md5sums=('b128bbd324f03eb42ef5060080f87548')

conflicts=('libtorrent')
provides=('libtorrent')


build() {
  cd "$srcdir/libtorrent-$pkgver"
  CXXFLAGS="$CXXFLAGS -fno-strict-aliasing" \
    ./configure --prefix=/usr --disable-debug
  make
}

package() {
  cd "$srcdir/libtorrent-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
