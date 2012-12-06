# Maintainer: Damir Jelic <poljarinho@gmail.com>

pkgname=libtorrent-unstable
_pkgname=libtorrent
pkgver=0.13.3
pkgrel=1
pkgdesc="BitTorrent library written in C++"
arch=('i686' 'x86_64')
url="http://libtorrent.rakshasa.no"
license=('GPL')
depends=('libsigc++2.0' 'openssl')
provides=('libtorrent')
conflicts=('libtorrent' 'libtorrent-svn')
options=('!libtool')
source=(http://libtorrent.rakshasa.no/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('e94f6c590bb02aaf4d58618f738a85f2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  CXXFLAGS="$CXXFLAGS -fno-strict-aliasing" \
    ./configure --prefix=/usr --disable-debug || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}

#vim:set ts=2 sw=2 et:
