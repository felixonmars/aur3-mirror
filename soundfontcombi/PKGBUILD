# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=soundfontcombi
pkgver=0.018
pkgrel=2
pkgdesc="Conynects ALSA sequencer clients"
arch=('i686' 'x86_64')
url="http://personal.telefonica.terra.es/web/soudfontcombi/soundfontcombi.html"
license=('GPLv2')
depends=('alsa-lib' 'fltk')
optdepends=('SBlive'
    'Fluidsynth: A real-time software synthesizer based on the SoundFont 2 specifications'
    'Timidity: A MIDI to WAVE converter and player'
    'ZynAddSubFX: software synthesizer capable of making a countless number of instruments'
    "vkeybd: A virtual MIDI keyboard for X (or any other MIDI keyboard or virtual keyboard)")
source=("http://personal.telefonica.terra.es/web/soudfontcombi/sfc-${pkgver}.tar.gz")
md5sums=('f117cfebf1f3f13f4a3d77d67c8febd6')

build() {
  cd ${srcdir}/sfc-${pkgver}
  ./configure --prefix=/usr
  make DESTDIR=${pkgdir} PREFIX="/usr"
}

package(){
 cd ${srcdir}/sfc-${pkgver}
 make DESTDIR=${pkgdir} PREFIX="/usr" install
}
# vim:set ts=2 sw=2 et: