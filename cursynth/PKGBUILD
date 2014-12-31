# Maintainer: M0Rf30

pkgname=cursynth
pkgver=1.5
pkgrel=2
pkgdesc='A polyphonic music synthesizer that runs graphically inside your terminal'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/cursynth/'
license=('GPL3')
depends=('ncurses' 'alsa-lib' 'pulseaudio' 'jack')
source=(ftp://ftp.gnu.org/gnu/cursynth/cursynth-latest.tar.gz
	patch)

build() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../patch
  autoreconf -i
  ./configure --prefix=/usr --with-pulse --with-jack --with-alsa 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('a70927bc0edc7c6ec38b5a5185a573ad'
         '63da0a48779bfb1b7afad7e6d2523040')
