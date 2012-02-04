# Contributor: Martin Häger <martin.haeger@gmail.com>
pkgname=libopenspc
pkgver=0.3.99a
pkgrel=1
pkgdesc="Provides a library that allows for the emulated playback of SPC files, which are SNES audio files."
arch=('i686')
url="http://web.archive.org/web/20040930224420/web.umr.edu/~bmartin"
license=('LGPL' 'custom')
depends=('zlib')
makedepends=('nasm')
options=(!libtool)
source=("http://ftp.debian.org/debian/pool/main/libo/libopenspc/${pkgname}_$pkgver.orig.tar.gz")
md5sums=('8f94764ebdf4fedcd75a1d54412378a1')

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  
  autoreconf -iv
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -D -m644 libopenspc/LICENSE "$pkgdir/usr/share/licenses/libopenspc/LICENSE"
}

# vim:set ts=2 sw=2 et:
