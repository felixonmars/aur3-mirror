# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(midisend)
pkgver=0.0.1
pkgrel=2
pkgdesc="A simple command line tool that you can use to send MIDI events via the ALSA MIDI sequencer."
arch=('i686' 'x86_64')
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('alsa-lib')
source=($url$pkgname.c)
md5sums=('dc932068b1212dc6fe3d0e1f380304d0')

build() {

  cc -o midisend -lasound midisend.c
}

package() {

  mkdir -p "$pkgdir/usr/bin"
  install -Dm 755 midisend "$pkgdir/usr/bin"
}

