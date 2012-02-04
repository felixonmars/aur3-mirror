# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Jiyunatori <tori@0xc29.net>

pkgname=a2jmidid
pkgver=7
pkgrel=2
pkgdesc="A daemon for exposing legacy ALSA sequencer applications in JACK MIDI system."
arch=('i686' 'x86_64')
url="http://home.gna.org/$pkgname/"
license=('GPL')
depends=('jack' 'dbus-python')
source=("http://download.gna.org/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('195f5587904ce307cbcd4ef89f2c791f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  sed -i "s|\(env python\).*|\12|" a2j_control

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf install --destdir="$pkgdir/"
}
