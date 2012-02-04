# Maintainer:  fiatguy85 fiatguy85<at>gmail<dot>com

pkgname=transmission-b4rt
pkgver=1.93
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client modified for TorrentFlux-b4rt"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl')
makedepends=('intltool')
replaces=('transmission')
backup=()
install=
source=(http://mirrors.m0k.org/transmission/files/transmission-$pkgver.tar.bz2
	cli.c
	transmission.h)
md5sums=('f68358d03e46bec5704bbaa894990152'
         '467a2581126c568e507a1b1f03714f33'
         '9bc926bf94902856bd604d34a7c8d673')

build() {
  cd "$srcdir/transmission-$pkgver"

  cp $srcdir/cli.c ./cli
  cp $srcdir/transmission.h ./libtransmission
  ./configure --prefix=/usr --enable-nls --enable-cli --disable-daemon --disable-gtk || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING" || return 1
}
