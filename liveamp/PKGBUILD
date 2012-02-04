#Maintainer: Naelstrof <naelstrof@gmail.com>

pkgname=liveamp
pkgver=3
pkgrel=1
pkgdesc="Makes your desktop wallpaper flash to active sounds!"
url="http://steamcommunity.com/id/Naelstrof"
arch=('i686' 'x86_64')
license=('MIT')
if [ "${CARCH}" = "x86_64" ]; then
depends=('libpng' 'pulseaudio' 'lib32-libpulse' 'libxext' 'libx11')
else
depends=('lib32-libpng' 'pulseaudio' 'lib32-libpulse' 'lib32-libxext' 'lib32-libx11')
fi
makedepends=('make' 'gcc' 'tar')
source=()
md5sums=()

build() {
   cd "$srcdir"
   git clone git://github.com/naelstrof/liveamp.git
   cd "liveamp"
   make
}


package() {
	cd "$srcdir/liveamp"
    make DESTDIR=$pkgdir install
}
