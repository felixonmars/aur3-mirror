# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=vocproc
pkgver=0.2
pkgrel=1
pkgdesc="A vocal processing lv2 plugin, pitch shifting with or without formant correction, automatic pitch correction, vocoder effect and harmonizer"
arch=('i686' 'x86_64')
url="http://hyperglitch.com/dev/VocProc/"
license=('GPL2')
depends=('gtkmm' 'fftw')
makedepends=('lv2-c++-tools')
source=(http://hyperglitch.com/files/vocproc/$pkgname-$pkgver.tar.gz)
md5sums=('21c9268679192f9fe095474027f74e0c')

build() {
  cd "${srcdir}/${pkgname}.lv2"

  sed -i "s|/usr/local/lib/lv2|${pkgdir}/usr/lib/lv2|" Makefile || return 1
  make || return 1
  make install || return 1
}

# vim:set ts=2 sw=2 et:
