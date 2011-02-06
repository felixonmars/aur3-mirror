# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Joe Davison <joe@thosedamnpeanuts.com>

pkgname=fluidsynth-oss
pkgver=1.1.1
pkgrel=1
pkgdesc="A realtime software MIDI synthesizer based on the SoundFont 2 specifications"
arch=("i686" "x86_64")
url="http://www.fluidsynth.org/"
license=('LGPL')
depends=('readline' 'oss')
makedepends=('pkgconfig>=0.9')
provides=('fluidsynth')
conflicts=('fluidsynth')
options=('!libtool')
source=(http://savannah.nongnu.org/download/fluid/fluidsynth-$pkgver.tar.gz)
md5sums=('0db3da78028d255026230809c6e21b44')


build() {
  cd fluidsynth-$pkgver

  ./configure	--prefix=/usr \
		--disable-static \
		--enable-ladspa \
		--enable-oss-support \
		--disable-alsa-support \
		--disable-jack-support

  make || return 1
  make DESTDIR="$pkgdir" install
}

