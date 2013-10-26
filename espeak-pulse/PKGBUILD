# Maintainer:  GEEK1 <arch@geek1.de>
# Contributor: niQo
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mathias Fussenegger <jordi@archlinux.us>
# Contributor: Mateusz Herych <heniekk@gmail.com>

basename=espeak
pkgname=${basename}-pulse
pkgver=1.47.11
pkgrel=1
pkgdesc="Text to Speech engine for good quality English, with support for other languages"
arch=('i686' 'x86_64')
url="http://espeak.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'libpulse')
conflicts=("${basename}")
provides=("${basename}")
source=(http://downloads.sourceforge.net/sourceforge/${basename}/${basename}-${pkgver}-source.zip)
md5sums=('541c1a8f2c198ccda098f53f9f61a66a')

build() {
  cd ${startdir}/src/${basename}-${pkgver}-source/src
  sed -i 's/AUDIO = portaudio/AUDIO = pulseaudio/g' Makefile
  #sed -i 's/AUDIO = portaudio/AUDIO = runtime/g' Makefile
  # ^ 'runtime' uses pulseaudio if it is running, else uses portaudio
  make CXXFLAGS="$CXXFLAGS"
}

package() {
  cd ${startdir}/src/${basename}-${pkgver}-source/src
  make DESTDIR=${pkgdir} install
  chmod 644 ${pkgdir}/usr/lib/libespeak.a
  cd ${startdir}/src/${basename}-${pkgver}-source
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
