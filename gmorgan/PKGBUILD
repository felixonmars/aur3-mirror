# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gmorgan
pkgver=0.56
pkgrel=1
pkgdesc="A rhythm station and a modern organ with full editable accompaniment for play in real time."
arch=(i686 x86_64)
url="http://gmorgan.sourceforge.net/"
license=('GPL')
depends=('fltk' 'alsa-lib')
source=("http://downloads.sourceforge.net/project/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=('650fe370ae6fe1bf9a154ab8c15499fc')

build() {
  cd "$srcdir/${pkgname}_$pkgver"

  # fix hardcoded ChordTable path
  sed -i 's|/local||' src/gmorgan.chord.cpp

  ./configure --prefix=/usr
  make

  # translations
  cd po && make update-gmo
}

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
