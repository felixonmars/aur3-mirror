# Maintainer:  fiatguy85 fiatguy85<at>gmail<dot>com

pkgname=transmission-ng
pkgver=2.12
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client modified for TorrentFlux-b4rt"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent')
makedepends=('intltool')
provides=('transmission')
conflicts=('transmission-cli' 'transmission-gtk' 'transmission-qt' 'transmission-b4rt')
backup=()
install=
source=(http://mirrors.m0k.org/transmission/files/transmission-$pkgver.tar.bz2
	cli.c
	transmission.h)
md5sums=('f3d34fdbbf3ae25635f9e7bf7e662cd9'
         'fff6635e0b976c12e4788f1c4e507459'
         'e20bf35f612647c95bcccc1b66afb7f9')

build() {
  cd "$srcdir/transmission-$pkgver"

  cp $srcdir/cli.c ./cli
  cp $srcdir/transmission.h ./libtransmission
  ./configure --prefix=/usr --enable-nls --enable-cli --disable-daemon --disable-gtk || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING" || return 1
}
