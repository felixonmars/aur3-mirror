# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=mcontrol
pkgver=0.1.05
pkgrel=1
pkgdesc="ALSA MIDI sequencer client and brings the possibility to assign up to twelve simultaneous MIDI control messages for each controller in your MIDI keyboard (Modulation Wheel, Breath Controller, Foot Controller, Pitch Bend and After Touch)."
arch=('i686' 'x86_64')
url="http://personal.telefonica.terra.es/web/soudfontcombi/mcontrol.html"
license=('GPL')
depends=('alsa-lib' 'fltk')

source=(http://personal.telefonica.terra.es/web/soudfontcombi/$pkgname-$pkgver.tar.gz)
md5sums=('af8d5e5fc069ca2c6b1ef8265121e792')


build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

