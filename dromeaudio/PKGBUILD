# Contributor: rabyte <rabyte*gmail>

pkgname=dromeaudio
pkgver=0.1.2
pkgrel=1
pkgdesc="A small audio manipulation and playback library written in C++"
arch=('i686' 'x86_64')
url="http://www.3ddrome.com/software/$pkgname.php"
license=('BSD')
depends=('sdl' 'libvorbis' 'gcc-libs' 'alsa-lib')
makedepends=('cmake')
source=(http://www.3ddrome.com/files/DromeAudio-$pkgver.tar.gz \
	$pkgname.pc)
md5sums=('44a6966fe82cee980d0843aa645b775a'
         '14144c3c55602258aab64d118214c5f4')

build() {
  cd DromeAudio-$pkgver

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr || return 1
  make DESTDIR=$pkgdir install

  install -m644 -D $srcdir/$pkgname.pc $pkgdir/usr/lib/pkgconfig/$pkgname.pc
  install -m644 -D ../COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
md5sums=('d88d641565b72a52603024d85339c958'
         '14144c3c55602258aab64d118214c5f4')
