# Contributor: Jiyunatori <tori@0xc29.net>
# Adapted from: Nate Slottow (m00tp01nt) <nslottow AT gmail DOT com>
pkgname=a2jmidid
pkgver=6
pkgrel=1
pkgdesc="A daemon for exposing legacy ALSA sequencer applications in JACK MIDI system."
arch=('i686' 'x86_64')
url="http://home.gna.org/a2jmidid/"
license=('GPL')
depends=(jack-audio-connection-kit dbus-core)
source=(http://download.gna.org/a2jmidid/$pkgname-$pkgver.tar.bz2)

build() {
  cd $srcdir/$pkgname-$pkgver

  ./waf configure --prefix=/usr
  ./waf
  ./waf install --destdir=$pkgdir || return 1
}

md5sums=('461969bc19a5331e9e81441c6431ef20')

