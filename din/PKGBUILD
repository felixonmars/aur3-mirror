# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=din
pkgver=5.2.1
pkgrel=1
pkgdesc="A software musical instrument and audio synthesizer using Bezier curves to draw waveforms."
arch=(i686 x86_64)
url="http://dinisnoise.org/"
license=('GPL3')
depends=('fftw' 'jack' 'liblo' 'libgl' 'libircclient' 'tcl')
makedepends=('mesa')
install="$pkgname.install"
source=("http://din.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('d5a9c375b58e7652004bfcc1e3e17f88')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # remove previously generated checkdotdin
  rm data/checkdotdin

  # colourized echo in m00 script
  sed -i "s|echo|& -e|" data/m00

  # tcl 8.6 fix
  sed -i "s/tcl8\.5/tcl8\.6/g" `grep -rl "tcl8\.5"`

  ./configure --prefix=/usr \
              --datarootdir=/usr/share
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
