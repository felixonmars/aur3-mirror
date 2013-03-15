# Maintainer: Marqin <marqin dot pl at google dot com>

_name=vModSynth
pkgname=vmodsynth
pkgver=1.0
pkgrel=1
pkgdesc="vModSynth is a synthesizer that tries to resemble to look&feel of a real, analog, modular synthesizer."
arch=(i686 x86_64)
url="http://launchpad.net/vmodsynth/"
license=('GPL3')
depends=('alsa-lib' 'gtkmm3' 'hicolor-icon-theme')
source=("http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('09ffb3ba74dd386f9818d792d10af849')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

