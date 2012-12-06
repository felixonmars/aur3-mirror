# Maintainer: Damir Jelic <poljarinho@gmail.com>

pkgname=rtorrent-unstable
_pkgname=rtorrent
pkgver=0.9.3
pkgrel=1
pkgdesc="Ncurses BitTorrent client based on libTorrent"
arch=('i686' 'x86_64')
url="http://libtorrent.rakshasa.no"
license=('GPL')
depends=('libtorrent-unstable=0.13.3' 'curl>=7.14.3' 'xmlrpc-c>=1858')
provides=('rtorrent')
conflicts=('rtorrent' 'rtorrent-svn')
source=("http://libtorrent.rakshasa.no/downloads/$_pkgname-$pkgver.tar.gz") 
md5sums=('0bf2f262faa8c8c8d3b11ce286ea2bf2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  CXXFLAGS="$CXXFLAGS  -fno-strict-aliasing" \
    ./configure --prefix=/usr --enable-debug --with-xmlrpc-c 
  make 
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
