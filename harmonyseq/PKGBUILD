# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=harmonySEQ
pkgname=harmonyseq
pkgver=0.16
pkgrel=1
pkgdesc="A loop-based MIDI software sequencer intended to help music composers and performers."
arch=(i686 x86_64)
url="http://harmonyseq.wordpress.com/"
license=('GPL')
depends=('alsa-lib' 'gtkmm' 'liblo' 'hicolor-icon-theme' 'desktop-file-utils')
install="$pkgname.install"
source=("http://launchpad.net/$pkgname/stable/$pkgver/+download/$_name-$pkgver.tar.gz")
md5sums=('c6aae192bd3e0333fe42ef413e1259c6')

build() {
  cd "$srcdir/$_name-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
