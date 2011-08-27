# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=raton
pkgver=0.22
pkgrel=1
pkgdesc="Translates mouse movements into MIDI controller messages"
arch=(i686 x86_64)
url="http://home.earthlink.net/~gmoonlit/raton/"
license=('GPL')
depends=('alsa-lib' 'gtk2')
source=("${url}data/${pkgname}_v${pkgver}.tar.gz")
md5sums=('b2b289316a2c3e140f5c8048a26c04d7')

build() {
  cd "$srcdir/${pkgname}_v${pkgver}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}_v${pkgver}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
