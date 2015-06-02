# Maintainer: celsius <chris@opensuse.us>
pkgname=vice-ethernet
_pkgname=vice
pkgver=2.4
pkgrel=4
pkgdesc="A Versatile Commodore Emulator , ethernet enabled"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=('giflib' 'lame' 'libjpeg' 'libpng' 'libxrandr' 'libnet' 'libpcap' 'vte')
makedepends=('xorg-font-utils' 'pkg-config')
optdepends=('pulseaudio' 'pulseaudio-alsa' 'alsa-lib')
provides=("vice=$pkgver")
conflicts=('vice' 'vice-gnome' 'vice-gtkglext' 'vice-sdl' 'vice-2.2gnomeui')
replaces=('vice')
source=(http://downloads.sourceforge.net/project/vice-emu/releases/${_pkgname}-${pkgver}.tar.gz vice-2.3-no-fc-cache.patch
vice-2.4-giflib-5.1.0.patch)

md5sums=('b017647a0c159bbe43cdb81762d1c577' 'c7ba8ff930bee0e41565f4a1d9594922' 'da055d4e65b74a62bfb28e2d1dcd94a5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
 
  patch -Np1 -i ../vice-2.3-no-fc-cache.patch
  
  patch -Np1 -i ../vice-2.4-giflib-5.1.0.patch
  
   
  ./configure  --mandir=/usr/local/man --enable-ethernet --enable-fullscreen --enable-gnomeui --disable-ffmpeg 
  
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
	
  make DESTDIR="$pkgdir/" install
}
