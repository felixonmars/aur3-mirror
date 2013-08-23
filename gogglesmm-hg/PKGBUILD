# Maintainer: Sander Jansen <s.jansen@gmail.com>
pkgname=gogglesmm-hg
pkgver=517
pkgrel=1
pkgdesc="Goggles Music Manager"
arch=('i686' 'x86_64' 'arm')
url="http://code.google.com/p/gogglesmm/"
license=('GPL3')
conflicts=('gogglesmm')
depends=('fox-devel>=1.7.37' 'libogg' 'libvorbis' 'flac' 'libmad' 'faad2' 'expat' 'opus' 'dbus-core' 'taglib>=1.7.0' 'sqlite3' 'libgcrypt' 'glu')
makedepends=('mercurial' 'pkgconfig' 'libpulse' 'alsa-lib' 'librsvg' 'glproto' 'dri2proto' )
optdepends=('libpulse: PulseAudio Output' 'alsa-lib: Alsa Output')
md5sums=('SKIP')
source=('gogglesmm::hg+http://code.google.com/p/gogglesmm')

pkgver() {
  cd $srcdir/gogglesmm
  hg identify -n
}

build() {
  cd "$srcdir/gogglesmm"
  export RESWRAP=/usr/bin/reswrap-1.7
  ./configure
  make
  make svg2png
}

package() {
  cd "$srcdir/gogglesmm"
  make DESTDIR="$pkgdir" install
}


# vim:set ts=2 sw=2 et:
