# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=synthofnoise
pkgver=0.1
pkgrel=2
pkgdesc="Synth Of Noise, noisify your audio"
arch=('i686' 'x86_64')
url="http://code.google.com/p/noisesmith-linux-audio/"
license=('GPL3')
depends=('fltk' 'jack')
source=(http://noisesmith-linux-audio.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('be6812025679d2fc7e9fe88ac3c5af9c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|Fl/|FL/|' main.c++
  make
  mkdir -p "${pkgdir}/usr/bin/"
  install -m755 synth "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
